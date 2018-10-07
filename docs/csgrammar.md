# Extracting the Structure

In the [previous chapter](grammar.md) we created a parser to extract a list of JavaScript strings from an HTML source.
Now we extend the parser to extract an HTML structure as well. 

## Matching Open And Close Tags

Elements of HTML has an interesting property: the name of an opening tag has to match the name of a closing tag. 
Natural for humans, but challenging for parsers.

<!--
Unfortunately, standard solutions do not really work as we would like to.
TODO(kurs): do we?
We describe problem in more details in the supplementary [Matching Tags](../matchingTags.pillar) chapter.
-->

PetitParser2 comes with a special syntax to express constrains of matching open and close tags.
It can store a result of a rule (e.g. opening an html tag) onto a stack using the ```push``` operator and assert that a result of a rule (e.g. closing an html tag) matches the top of the stack using the ```match``` operator.

First define an element name as a repetition of letters and digits:

<!--
t sourceFor: #elementName in: WebGrammar.
-->
```smalltalk
WebGrammar>>elementName
  ^ #word asPParser plus flatten
```

Than define an element as a sequence of ```elOpen```, ```elContent``` and ```elClose```:

```smalltalk
WebGrammar>>element
  ^ (elOpen, elContent, elClose)
```

In ```elOpen```, we push the element name as well as we possible arguments as a water:

<!--
t sourceFor: #elOpen in: WebGrammar)
-->
```smalltalk
WebGrammar>>elOpen
  ^ $< asPParser, elementName push, any starLazy, $> asPParser 
    ==> #second
```

In ```elClose```, we first match the element name against the top of a stack and we pop the stack:

<!--
t sourceFor: #elClose in: WebGrammar)
-->
```smalltalk
WebGrammar>>elClose
  ^ '</' asPParser, elementName match pop, $> asPParser
```

## Element Content
```elContent``` is a zero or more repetitions of the following elements (in the given order): 
1. a javascript code; 
1. another element; or 
1. an unknown text. 

{% include note.html content="
Javascript is on the first position because it is *kind of* element and therefore must be ordered before an element rule. 
The same holds for the element rule, it is also *kind of* text. 
"%}

<!--
t sourceFor: #elContent in: WebGrammar)
-->
```smalltalk
WebGrammar>>elContent
  ^ (javascript / element / text nonEpsilon) star
```


Text can be anything.
Therefore, we define it as with the help of bounded seas, concretely using the ```starLazy``` operator:

```smalltalk
WebGrammar>>text
  ^ #any starLazy
```


{% include note.html content="
### Epsilon in Repetitions
Note, we mark the ```text``` rule with ```nonEpsilon```.
The ```nonEpsilon``` operator is an extension of PEGs that forbids epsilon parses (in other words if the underlying parser does not consume any input, it fails).
The reason for this is that ```#any asPParser starLazy``` can consume anything, even the empty string, because the ```starLazy``` operator allows for zero repetitions. 

<!-- @@todo perhaps define ```plusLazy```. -->

Without ```nonEpsilon```, the star repetition of ```elContent``` would end up in an infinite loop recognizing an epsilon in each of its iterations, never failing, never stopping.
You can easily freeze your image by running the following code (we recommend saving your image now):

```smalltalk
#any asPParser optional star parse: 'endless loop'
``` 
"%}


## Testing the Code
Testing is always a good practice, let's start with ```text```:

<!--
t sourceFor: #testText in: WebGrammarTest.
-->
```smalltalk
WebGrammarTest>>testText
  self parse: 'foobar' rule: #text
```


And ```element``` follows:

<!--
t sourceFor: #testElement in: WebGrammarTest.
t sourceFor: #testElementEmpty in: WebGrammarTest.
t sourceFor: #testElementNested in: WebGrammarTest.
-->
```smalltalk
WebGrammarTest>>testElement
  self parse: '<p>lorem ipsum</p>' 
       rule: #element.

WebGrammarTest>>testElementEmpty
  self parse: '<foo></foo>' 
       rule: #element.

WebGrammarTest>>testElementNested
  self parse: '<p>lorem <i>ipsum</i></p>' 
       rule: #element.
```

We should be able to parse malformed elements as well. 
Lets see if the ```push```, ```match```, ```pop``` magic works, as expected:

<!--
t sourceFor: #testElementMalformedWrongClose in: WebGrammarTest.
t sourceFor: #testElementMalformedExtraClose in: WebGrammarTest.
t sourceFor: #testElementMalformedUnclosed in: WebGrammarTest.
-->
```smalltalk
WebGrammarTest>>testElementMalformedWrongClose
  self parse: '<foo><bar>meh</baz></foo>' 
       rule: #element.

WebGrammarTest>>testElementMalformedExtraClose
  self parse: '<foo><bar>meh</bar></fii></foo>' 
       rule: #element.

WebGrammarTest>>testElementMalformedUnclosed
  self parse: '<head><meta content="mess"></head>' 
       rule: #element.
```

## Summary

We extended our parser to match opening and closing elements of HTML.
To do so, we used context-sensitive extension of PetitParser2: ```push```, ```pop``` and ```matches``` rules.
