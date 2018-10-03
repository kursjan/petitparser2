Class {
	#name : #PP2WebPageGrammarTest,
	#superclass : #PP2CompositeNodeTest,
	#instVars : [
		'context',
		'input'
	],
	#category : 'PetitParser2-Html-Tests-Core'
}

{ #category : #accessing }
PP2WebPageGrammarTest >> context [
	context isNil ifTrue: [ 
		context := super context
	].

	^ context
]

{ #category : #accessing }
PP2WebPageGrammarTest >> parserClass [
	^ PP2WebPageGrammar 
]

{ #category : #'tests - document' }
PP2WebPageGrammarTest >> testDocument [
	input := '<html>
		<body>
			<script type="text/javascript">alert("hello world")</script>
		</body>
	</html>'.
	
	self parse: input rule: #document
]

{ #category : #'tests - document' }
PP2WebPageGrammarTest >> testDocument2 [
	input := '
<!DOCTYPE html>
<!-- comment -->
<html>
	<meta content="origin" name="referrer">

	<body>
		<script type="text/javascript">alert("hello world")</script>
	</body>
</html>'.
	
	self parse: input rule: #document
]

{ #category : #'tests - document' }
PP2WebPageGrammarTest >> testDocument3 [
	input := '
<!DOCTYPE html>
<!-- comment -->
<html>
	<meta content="origin" name="referrer">

	<body>
		<div>foobar</div>
		<div>bar<span>baz</span></div>
	</body>
</html>'.
	
	self parse: input rule: #document
]

{ #category : #'tests - document' }
PP2WebPageGrammarTest >> testDocument4 [
	input := '
<html>
	<head>
	<meta content="text/mess">
	<meta content="text/mess">
	</head>
	<body>
	</body>
</html>'.
	
	self parse: input rule: #document
]

{ #category : #'tests - element' }
PP2WebPageGrammarTest >> testElClose [
	self context defaultStack push: 'foo'.
	self parse: '</foo>' rule: #elClose
]

{ #category : #'tests - element' }
PP2WebPageGrammarTest >> testElContent [
	self parse: '' rule: #elContent.
	self parse: 'foobar' rule: #elContent.
	self parse: '<script type="text/javascript">eh</script>' rule: #elContent.
]

{ #category : #'tests - element' }
PP2WebPageGrammarTest >> testElOpen [
	self parse: '<foo id="bar">' rule: #elOpen
]

{ #category : #tests }
PP2WebPageGrammarTest >> testElement [
	self parse: '<p>lorem ipsum</p>' rule: #element
]

{ #category : #'tests - element' }
PP2WebPageGrammarTest >> testElementEmpty [
	self parse: '<foo></foo>' rule: #element
]

{ #category : #'tests - element' }
PP2WebPageGrammarTest >> testElementMalformed [
	self parse: '<foo><bar>meh</baz></foo>' rule: #element.
]

{ #category : #tests }
PP2WebPageGrammarTest >> testElementMalformedExtraClose [
	self parse: '<foo><bar>meh</bar></fii></foo>' rule: #element
]

{ #category : #tests }
PP2WebPageGrammarTest >> testElementMalformedSwapped [
	self fail: '<foo><bar>meh</foo></bar>' rule: #element
]

{ #category : #'tests - element' }
PP2WebPageGrammarTest >> testElementMalformedUnclosed [
	self parse: '<head><meta content="mess"></head>' rule: #element.
]

{ #category : #tests }
PP2WebPageGrammarTest >> testElementNested [
	self parse: '<p>lorem <i>ipsum</i></p>' rule: #element
]

{ #category : #'tests - javascript' }
PP2WebPageGrammarTest >> testJavascript [
	self parse: '<script type=''text/javascript''>alert(1+2)</script>' rule: #javascript
]

{ #category : #'tests - javascript' }
PP2WebPageGrammarTest >> testJavascriptContentString [
	self parse: 'alert("foobar")' rule: #jsContent.
	self parse: 'alert("</script>")' rule: #jsContent	
]

{ #category : #'tests - javascript' }
PP2WebPageGrammarTest >> testJavascriptShort [
	self parse: '<script>alert(1+2)</script>' rule: #javascript
]

{ #category : #'tests - javascript' }
PP2WebPageGrammarTest >> testJavascriptWithString [
	self parse: '<script type=''text/javascript''>alert("</script>")</script>' rule: #javascript
]

{ #category : #'tests - javascript' }
PP2WebPageGrammarTest >> testJsDoubleQuoteStringJavascript [
	self parse: '"Hello World!"' rule: #jsDoubleQuoteString	.
	self parse: '"</script>"' rule: #jsDoubleQuoteString
]

{ #category : #tests }
PP2WebPageGrammarTest >> testRawText [
	self parse: 'foobar' rule: #rawText
]
