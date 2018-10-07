# Create an Abstract Syntax Tree
In the [previous chapter](csgrammar.md) we tested our grammar to parse nested elements.
We know it the grammar parses the input, but we don't know what is the result.
We implement structured html representation in this chapter.


{% include note.html content="
The typical output of a parser is detailed and not suitable for further processing. 
It is called concrete syntax tree (CST), which is (in the case of PetitParser) an array of arrays of arrays of ... arrays.
Characters and strings leaf nodes.
"%}

## AST Nodes
Convenient representation of an input is an *abstract syntax tree* (AST). 
AST in our case will be a tree with HTML and JavaScript elements.
The AST we will use consists of three nodes: 
1. a JavaScript code; 
1. an HTML element; and
1. a text.

We define these nodes as follows, starting with its abstract predecessor ```WebElement``` with some convenience methods.

{% include warning.html content="
Note that ```WebParser``` and other classes are already loaded in your image. You might want to save them for future reference, or rename them before doing next steps.
"%}

<!--
t definitionFor: WebElement.
t sourceFor: #children in: WebElement.
t sourceFor: #firstChild in: WebElement.
t sourceFor: #secondChild in: WebElement.
t sourceFor: #gtTreeViewIn: in: WebElement.
-->
```smalltalk
Object subclass: #WebElement
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''
  category: 'PetitParser2-Tutorial'

WebElement>>children
  ^ #()

WebElement>>firstChild
  "Just for convenience"
  ^ self children first

WebElement>>secondChild
  "Just for convenience"
  ^ self children second

WebElement>>gtTreeViewIn: composite
  <gtInspectorPresentationOrder: 40>

  composite tree
    title: 'Tree';
    children: [:n | n children ];
    format: [:n| n displayText printStringLimitedTo: 50 ];
    shouldExpandToLevel: 6
```

```JavascriptElement``` follows:

<!--
t definitionFor: JavascriptElement.
t sourceFor: #code in: JavascriptElement.
t sourceFor: #code: in: JavascriptElement.
t sourceFor: #displayText in: JavascriptElement.
t sourceFor: #gtText: in: JavascriptElement.
-->

```smalltalk
WebElement subclass: #JavascriptElement
  instanceVariableNames: 'code'
  classVariableNames: ''
  poolDictionaries: ''
  category: 'PetitParser2-Tutorial'

JavascriptElement>>code
  ^ code

JavascriptElement>>code: anObject
  code := anObject

JavascriptElement>>displayText
  ^ self code

JavascriptElement>>gtText: composite
  <gtInspectorPresentationOrder: 40>
  
  composite text
    title: 'Text';
    display: [ :context | code ]
```

As well as ```HtmlElement```:

<!--
t definitionFor: HtmlElement.
t sourceFor: #children in: HtmlElement.
t sourceFor: #name in: HtmlElement.
t sourceFor: #name: in: HtmlElemednt.
t sourceFor: #displayText in: HtmlElement.
-->

```smalltalk
WebElement subclass: #HtmlElement
  instanceVariableNames: 'name children'
  classVariableNames: ''
  poolDictionaries: ''
  category: 'PetitParser2-Tutorial'

HtmlElement>>children
  ^ children

HtmlElement>>name
  ^ name

HtmlElement>>name: newName
  name := newName

HtmlElement>>displayText
  ^ self name
```


Last but not least ```UnknownText```:

<!--
t definitionFor: UnknownText.
t sourceFor: #text in: UnknownText.
t sourceFor: #text: in: UnknownText.
t sourceFor: #gtText: in: UnknownText.
-->
```smalltalk
WebElement subclass: #UnknownText
  instanceVariableNames: 'text'
  classVariableNames: ''
  poolDictionaries: ''
  category: 'PetitParser2-Tutorial'.

UnknownText>>text
  ^ text.

UnknownText>>text: anObject
  text := anObject.

UnknownText>>gtText: composite
  <gtInspectorPresentationOrder: 40>
  
  composite text
    title: 'Text';
    display: [ :context | text ].
```



## From a Grammar to a Parser

It is a good practice in PetitParser2 to split grammar (returns concrete syntax tree) and parser (returns abstract syntax tree). 
We do this by subclassing ```WebGrammar```:

<!--
t definitionFor: WebParser.
-->
```smalltalk
WebGrammar subclass: #WebParser
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''
  category: 'PetitParser2-Tutorial'
```

Now we override the rules of ```WebGrammar``` in ```WebParser``` so that the ```javascript``` rule returns ```JavascriptElement```, the ```element``` rule returns ```HtmlElement``` and the ```text``` rule returns ```UnknownText```:

<!--
(t sourceFor: #javascript in: WebParser), String lf,
(t sourceFor: #element in: WebParser), String lf,
(t sourceFor: #text in: WebParser).
-->
```smalltalk
WebParser>>javascript
  ^ super javascript
  
  map: [ :_code | 
    (JavascriptElement new)
      code: _code;
      yourself
  ]

WebParser>>element
  ^ super element 
  
  map: [ :_open :_content :_close | 
     (HtmlElement new)
      name: _open;
      children: _content;
      yourself
  ]

WebParser>>text
  ^ super text flatten
  
  map: [ :_value | 
    UnknownText new
      text: _value;
      yourself  
  ]
```

And finally, for convenience, we trim whitespaces around html elements:

<!--
(t sourceFor: #elClose in: WebParser), String lf,
(t sourceFor: #elOpen in: WebParser)
-->
```smalltalk
WebParser>>elClose
  ^ super elClose trim

WebParser>>elOpen
  ^ super elOpen trimRight
```

{% include note.html content="
There is ```trimRight``` in ```elOpen```, which means that only the whitespace on the right is trimmed. This makes caching of PetitParser slightly more efficient, because element always starts at the first non-whitespace character. If there is a trimming from left and right (using the ```trim```), it might start at any preceding whitespace or the first non-whitespace character and this would lead into lower cache-hit ratio (we will talk about caches later).
"%}

## Testing 
Don't forget tests.

<!--
t := PP2Tutorial new.
(t definitionFor: WebParserTest), String lf,
(t sourceFor: #parserClass in: WebParserTest), String lf,
(t sourceFor: #testElement in: WebParserTest), String lf,
(t sourceFor: #testElementEmpty in: WebParserTest), String lf,
(t sourceFor: #testElementNested in: WebParserTest), String lf.
-->
```smalltalk
WebGrammarTest subclass: #WebParserTest
  uses: TPP2TypeAssertions
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''
  category: 'PetitParser2-Tutorial'

WebParserTest>>parserClass
  ^ WebParser

WebParserTest>>testElement
  super testElement.
  
  self assert: result name equals: 'p'.
  self assert: result firstChild text equals: 'lorem ipsum'

WebParserTest>>testElementEmpty
  super testElementEmpty.
  
  self assert: result name equals: 'foo'.

WebParserTest>>testElementNested
  super testElementNested.
  
  self assert: result name equals: 'p'.
  self assert: result firstChild text trim equals: 'lorem'.
  self assert: result secondChild name equals: 'i'.
  self assert: result secondChild firstChild text equals: 'ipsum'
```


And for malformed elements, we expect the following results:

<!--
t := PP2Tutorial new.
(t sourceFor: #testElementMalformedExtraClose in: WebParserTest), String lf,
(t sourceFor: #testElementMalformedWrongClose in: WebParserTest), String lf,
(t sourceFor: #testElementMalformedUnclosed in: WebParserTest), String lf.
-->

```smalltalk
WebParserTest>>testElementMalformedExtraClose
  super testElementMalformedExtraClose.
  
  self assert: result name equals: 'foo'.
  self assert: result secondChild text equals: '</fii>'

WebParserTest>>testElementMalformedWrongClose
  super testElementMalformedWrongClose.
  
  self assert: result name equals: 'foo'.
  self assert: result firstChild text equals: '<bar>meh</baz>'

WebParserTest>>testElementMalformedUnclosed
  super testElementMalformedUnclosed.
  
  self assert: result name equals: 'head'.
  self assert: result firstChild text trim equals: '<meta content="mess">'
```


And of course, we expect JavaScript code to be extracted as follows:
<!--
t := PP2Tutorial new.
(t sourceFor: #testJavascript in: WebParserTest), String lf,
(t sourceFor: #testJavascriptWithString in: WebParserTest), String lf.
-->
```smalltalk
WebParserTest>>testJavascript
	super testJavascript.
	
	self assert: result code equals: 'alert("hi there!")'

WebParserTest>>testJavascriptWithString
	super testJavascriptWithString.
	
	self assert: result code equals: 'alert(''</script>'')'
```

Try if tests pass:

```smalltalk
(WebParserTest buildSuiteFromMethods: #(
  #testElement
  #testElementEmpty
  #testElementNested
  #testElementMalformedUnclosed
  #testElementMalformedExtraClose
  #testElementMalformedWrongClose
  #testJavascript
  #testJavascriptWithString)) run
```
```
8 run, 8 passes, 0 skipped, 0 expected failures, 0 failures, 0 errors, 0 unexpected passes
```

## Summary 
We defined ```WebParser```, which extends the ```WebGrammar``` and builds the AST nodes.

### Sources
The sources of this tutorial are part of the PetitParser2 package, you just need to install PetitParser2 or use Moose as described in the [Introduction](index.md).
