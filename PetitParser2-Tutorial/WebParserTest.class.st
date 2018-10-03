Class {
	#name : #WebParserTest,
	#superclass : #WebGrammarTest,
	#traits : 'TPP2TypeAssertions',
	#classTraits : 'TPP2TypeAssertions classTrait',
	#category : 'PetitParser2-Tutorial'
}

{ #category : #assertions }
WebParserTest >> assert: anObject isKindOf: aClass [
	self assert: (anObject isKindOf: aClass)
]

{ #category : #assertions }
WebParserTest >> deny: anObject isKindOf: aClass [
	self assert: (anObject isKindOf: aClass) not
]

{ #category : #accessing }
WebParserTest >> parserClass [
	^ WebParser
]

{ #category : #tests }
WebParserTest >> testElement [
	super testElement.
	
	self assert: result name equals: 'p'.
	self assert: result firstChild text equals: 'lorem ipsum'
]

{ #category : #tests }
WebParserTest >> testElementEmpty [
	super testElementEmpty.
	
	self assert: result name equals: 'foo'.
]

{ #category : #tests }
WebParserTest >> testElementMalformedExtraClose [
	super testElementMalformedExtraClose.
	
	self assert: result name equals: 'foo'.
	self assert: result secondChild text equals: '</fii>'

]

{ #category : #tests }
WebParserTest >> testElementMalformedUnclosed [
	super testElementMalformedUnclosed.
	
	self assert: result name equals: 'head'.
	self assert: result firstChild text trim equals: '<meta content="mess">'
]

{ #category : #tests }
WebParserTest >> testElementMalformedWrongClose [
	super testElementMalformedWrongClose.
	
	self assert: result name equals: 'foo'.
	self assert: result firstChild text equals: '<bar>meh</baz>'
]

{ #category : #tests }
WebParserTest >> testElementNested [
	super testElementNested.
	
	self assert: result name equals: 'p'.
	self assert: result firstChild text trim equals: 'lorem'.
	self assert: result secondChild name equals: 'i'.
	self assert: result secondChild firstChild text equals: 'ipsum'
]

{ #category : #tests }
WebParserTest >> testJavascript [
	super testJavascript.
	
	self assert: result code equals: 'alert("hi there!")'

]

{ #category : #tests }
WebParserTest >> testJavascriptWithString [
	super testJavascriptWithString.
	
	self assert: result code equals: 'alert(''</script>'')'

]

{ #category : #tests }
WebParserTest >> testStructuredDocument [
	| html body |
	super testStructuredDocument.
	
	self assert: result name equals: 'DOCUMENT'.

	html := result secondChild.
	self assert: html name equals: 'html'.

	self assert: html firstChild name equals: 'head'.	
	self assert: html secondChild name equals: 'body'.
	
	body := html secondChild.
	self assert: body children size equals: 4.
]

{ #category : #tests }
WebParserTest >> testStructuredDocumentSimple [
	| html body javascript |
	super testStructuredDocumentSimple.
	
	self assert: result name equals: 'DOCUMENT'.


	html := result secondChild.
	self assert: html name equals: 'html'.

	body := html firstChild.
	self assert: body name equals: 'body'.
	
	javascript := body firstChild.
	self assert: javascript isKindOf: JavascriptElement.
	self assert: javascript code equals: 'alert("hello world")'.
]

{ #category : #tests }
WebParserTest >> testStructuredDocumentWithDoctype [
	| html body javascript |
	super testStructuredDocumentWithDoctype.
	
	self assert: result name equals: 'DOCUMENT'.


	html := result secondChild.
	self assert: html name equals: 'html'.

	body := html firstChild.
	self assert: body name equals: 'body'.
	
	javascript := body firstChild.
	self assert: javascript isKindOf: JavascriptElement.
	self assert: javascript code equals: 'alert("hello world")'.
]
