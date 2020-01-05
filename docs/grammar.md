# <a id="sec:grammar" />Grammar: Turning the script into a real parser

To scale we should turn the playground script into a proper parser.


{% include note.html content="
Turning a script into a class is a good practice, because it allows us to:

- manage cyclic dependencies, 
- simplify testing and 
- easily extend with new functionality. 
"%}

## Hands On
We create a parser by subclassing ```PP2CompositeNode```:

{% include warning.html content="
Note that ```WebGrammar``` and ```WebGrammarTest``` classes are already loaded in your image. You might want to save them for future reference, or rename them before doing next steps.
"%}

<!-- 
(PP2Tutorial new definitionFor: WebGrammar).
-->
```smalltalk
PP2CompositeNode subclass: #WebGrammar
  instanceVariableNames: 'document javascript elOpen elContent elClose elementName element text jsOpen jsContent jsClose jsString structuredDocument comment any'
  classVariableNames: ''
  poolDictionaries: ''
  category: 'PetitParser2-Tutorial'
```

### Javascript rule

We define a ```javascipt``` rule as follows:

<!--
| t |
t := PP2Tutorial new.
t sourceFor: #javascript in: WebGrammar.
-->

```smalltalk
WebGrammar>>javascript
  ^ jsOpen, jsContent, jsClose ==> #second
```

The rules of ```javascript``` are defined as follows:
<!--
| t |
t := PP2Tutorial new.
t sourceFor: #jsOpen in: WebGrammar.
t sourceFor: #jsClose in: WebGrammar.
t sourceFor: #jsContent in: WebGrammar.
t sourceFor: #jsString in: WebGrammar.
t sourceFor: #any in: WebGrammar.
-->

```smalltalk
WebGrammar>>jsOpen
  ^ '<script>' asPParser

WebGrammar>>jsClose
  ^ '</script>' asPParser

WebGrammar>>jsContent
  ^ (jsString / any) starLazy

WebGrammar>>jsString
  ^ $' asPParser, any starLazy, $' asPParser

WebGrammar>>any
  ^ #any asPParser
```

Cover the ```javascript``` rule with tests to make sure the rule works as expected. 
Do this by subclassing ```PP2CompositeParserTest``` and by adding test methods:

<!--
| t |
t := PP2Tutorial new.
t definitionFor: WebGrammarTest.
t sourceFor: #parserClass in: WebGrammarTest.
t sourceFor: #testJavascript in: WebGrammarTest.
-->

```smalltalk
PP2CompositeNodeTest subclass: #WebGrammarTest
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''
  category: 'PetitParser2-Tutorial'

WebGrammarTest>>parserClass
  ^ WebGrammar

WebGrammarTest>>testJavascript
  self 
    parse: '<script>alert("hi there!")</script>' 
    rule: #javascript  
```

### Document rule
To extract javascript from an html document, we first define the ```document``` rule simply as a repetition of ```javascript``` seas as we are interested only in javascript:

<!--
| t |
t := PP2Tutorial new.
t sourceFor: #document in: WebGrammar.
-->

```smalltalk
WebGrammar>>document
  ^ (javascript sea ==> #second) star
```

{% include note.html content="
Or alternatively:
```smalltalk
WebGrammar>>document
  ^ javascript islandInSea star
```

The ```islandInSea``` operator is a shorthand for:
```smalltalk
sea ==> #second
```
"%}

Do not forget the ```start``` rule:
```smalltalk
WebGrammar>>start
  ^ document 
```

And finally, we write a test for ```document```:

<!--
| t |
t := PP2Tutorial new.
t sourceFor: #testDocument in: WebGrammarTest.
-->
```smalltalk
WebGrammarTest>>testDocument
  | input |
  input := PP2Sources current htmlSample.
  
  self parse: input rule: #document.
  self assert: result size equals: 2.
```

Both tests should pass now:
```smalltalk
(WebGrammarTest buildSuiteFromMethods: #(#testDocument #testJavascript)) run.
```
```
2 run, 2 passes, 0 skipped, 0 expected failures, 0 failures, 0 errors, 0 unexpected passes
```

## Summary
We turned the script from previous chapter into a parser to be able to test and further extend our parser.
