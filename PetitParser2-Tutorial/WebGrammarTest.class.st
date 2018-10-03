Class {
	#name : #WebGrammarTest,
	#superclass : #PP2CompositeNodeTest,
	#category : 'PetitParser2-Tutorial'
}

{ #category : #accessing }
WebGrammarTest >> parserClass [
	^ WebGrammar
]

{ #category : #tests }
WebGrammarTest >> testComment [
	self parse: '<!-- html comment -->' rule: #comment

]

{ #category : #tests }
WebGrammarTest >> testDocument [
	| input |
	input := PP2Sources current htmlSample.
	
	self parse: input rule: #document.
	self assert: result size equals: 2.
]

{ #category : #tests }
WebGrammarTest >> testElement [
	self parse: '<p>lorem ipsum</p>' rule: #element

]

{ #category : #tests }
WebGrammarTest >> testElementEmpty [
	self parse: '<foo></foo>' rule: #element

]

{ #category : #tests }
WebGrammarTest >> testElementMalformedExtraClose [
	self parse: '<foo><bar>meh</bar></fii></foo>' rule: #element

]

{ #category : #tests }
WebGrammarTest >> testElementMalformedUnclosed [
	self parse: '<head><meta content="mess"></head>' rule: #element.

]

{ #category : #tests }
WebGrammarTest >> testElementMalformedWrongClose [
	self parse: '<foo><bar>meh</baz></foo>' rule: #element.

]

{ #category : #tests }
WebGrammarTest >> testElementNested [
	self parse: '<p>lorem <i>ipsum</i></p>' rule: #element

]

{ #category : #tests }
WebGrammarTest >> testJavascript [
	self parse: '<script>alert("hi there!")</script>' rule: #javascript	
]

{ #category : #tests }
WebGrammarTest >> testJavascriptWithString [
	self parse: '<script>alert(''</script>'')</script>' rule: #javascript

]

{ #category : #tests }
WebGrammarTest >> testStructuredDocument [
	| input |
	input := PP2Sources current htmlSample.
	
	self parse: input rule: #structuredDocument
]

{ #category : #tests }
WebGrammarTest >> testStructuredDocumentSimple [
	| input |
	input := '<html>
		<body>
			<script>alert("hello world")</script>
		</body>
	</html>'.
	
	self parse: input rule: #structuredDocument
]

{ #category : #tests }
WebGrammarTest >> testStructuredDocumentWithDoctype [
	| input |
	input := '
<!DOCTYPE html>
<!-- comment -->
<html>
	<body>
		<script>alert("hello world")</script>
	</body>
</html>'.
	
	self parse: input rule: #structuredDocument
]

{ #category : #tests }
WebGrammarTest >> testText [
	self parse: 'foobar' rule: #text

]
