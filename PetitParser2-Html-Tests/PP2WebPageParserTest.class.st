Class {
	#name : #PP2WebPageParserTest,
	#superclass : #PP2WebPageGrammarTest,
	#traits : 'TPP2WebPageParserTest',
	#classTraits : 'TPP2WebPageParserTest classTrait',
	#category : 'PetitParser2-Html-Tests-Core'
}

{ #category : #accessing }
PP2WebPageParserTest >> parserClass [
	^ PP2WebPageParser 
]

{ #category : #accessing }
PP2WebPageParserTest >> result [
	^ result
]

{ #category : #accessing }
PP2WebPageParserTest >> scripts: rootElement [
	^ rootElement allElements select: [ :e | e isKindOf: PP2JavascriptElement  ]
]

{ #category : #tests }
PP2WebPageParserTest >> testElement [
	super testElement.
	
	self assert: result name equals: 'p'.
	self assert: result firstChild text equals: 'lorem ipsum'
]

{ #category : #tests }
PP2WebPageParserTest >> testElementEmpty [
	super testElementEmpty.
	
	self assert: result name equals: 'foo'.
]

{ #category : #tests }
PP2WebPageParserTest >> testElementMalformed [
	super testElementMalformed.
	
	self assert: result name equals: 'foo'.
	self assert: result firstChild text equals: '<bar>meh</baz>'
]

{ #category : #tests }
PP2WebPageParserTest >> testElementMalformedExtraClose [
	super testElementMalformedExtraClose.
	
	self assert: result name equals: 'foo'.
	self assert: result secondChild text equals: '</fii>'
]

{ #category : #tests }
PP2WebPageParserTest >> testElementMalformedUnclosed [
	super testElementMalformedUnclosed.
	
	self assert: result name equals: 'head'.
	self assert: result firstChild text trim equals: '<meta content="mess">'
]

{ #category : #tests }
PP2WebPageParserTest >> testElementNested [
	super testElementNested.
	
	self assert: result name equals: 'p'.
	self assert: result firstChild text trim equals: 'lorem'.
	self assert: result secondChild name equals: 'i'.
	self assert: result secondChild firstChild text equals: 'ipsum'
]

{ #category : #tests }
PP2WebPageParserTest >> testJavascript [
	super testJavascript.
	
	self assert: result isKindOf: PP2JavascriptElement.
	self assert: result code equals: 'alert(1+2)'
]

{ #category : #tests }
PP2WebPageParserTest >> testJavascriptWithString [
	super testJavascriptWithString.
	
	self assert: result isKindOf: PP2JavascriptElement.
	self assert: result code equals: 'alert("</script>")'
]

{ #category : #tests }
PP2WebPageParserTest >> testRawText [
	super testRawText.
	
	self assert: result isKindOf: PP2HtmlText.
	self assert: result text equals: 'foobar'.
]
