Trait {
	#name : #TPP2WebPageParserTest,
	#traits : 'TPP2TypeAssertions',
	#classTraits : 'TPP2TypeAssertions classTrait',
	#category : 'PetitParser2-Html-Tests-Core'
}

{ #category : #assertions }
TPP2WebPageParserTest >> assert: anObject isKindOf: aClass [
	self assert: (anObject isKindOf: aClass)
]

{ #category : #assertions }
TPP2WebPageParserTest >> deny: anObject isKindOf: aClass [
	self assert: (anObject isKindOf: aClass) not
]

{ #category : #accessing }
TPP2WebPageParserTest >> result [
	self explicitRequirement
]

{ #category : #accessing }
TPP2WebPageParserTest >> scripts: rootElement [
	^ rootElement allElements select: [ :e | e isKindOf: JavascriptElement  ]
]

{ #category : #'tests - document' }
TPP2WebPageParserTest >> testDocument [
	| scripts |
	super testDocument.
	
	scripts := self scripts: self result.
	self assert: scripts size equals: 1.
	self assert: scripts first code equals: 'alert("hello world")'
]

{ #category : #'tests - document' }
TPP2WebPageParserTest >> testDocument2 [
	| scripts htmlElement |
	super testDocument2.
	
	scripts := self scripts: self result.
	self assert: scripts size equals: 1.
	self assert: scripts first code equals: 'alert("hello world")'.
	
	htmlElement := self result secondChild.
	self assert: htmlElement name equals: 'html'.
	self assert: htmlElement children size equals: 2.
	self assert: htmlElement firstChild isKindOf: PP2HtmlText.
	self assert: htmlElement secondChild name equals: 'body'.
]

{ #category : #'tests - document' }
TPP2WebPageParserTest >> testDocument3 [
	| htmlElement bodyElement |
	super testDocument3.
	
	htmlElement := self result secondChild.
	self assert: htmlElement name equals: 'html'.
	self assert: htmlElement children size equals: 2.
	self assert: htmlElement secondChild name equals: 'body'.
	
	bodyElement := htmlElement secondChild.
	self assert: bodyElement children size equals: 2.
	self assert: bodyElement secondChild secondChild name equals: 'span'.
]

{ #category : #'tests - document' }
TPP2WebPageParserTest >> testDocument4 [
	| htmlElement |
	super testDocument4.
	
	htmlElement := self result secondChild.
	self assert: htmlElement name equals: 'html'.
	self assert: htmlElement firstChild name equals: 'head'.
]
