Class {
	#name : #PP2NamedChildrenVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'parser',
		'result',
		'named'
	],
	#category : 'PetitParser2-GUI-Tests-Visitors'
}

{ #category : #'as yet unclassified' }
PP2NamedChildrenVisitorTest >> assert: aCollection anySatisfy: aBlock [
	self assert: (aCollection anySatisfy: aBlock)
]

{ #category : #'as yet unclassified' }
PP2NamedChildrenVisitorTest >> testDelegate [
	named := 'foo' asPParser
		name: 'foo';
		yourself.
		
	parser := named wrapped.
	self visit: parser.
	
	self assert: result size equals: 1.
	self assert: result anySatisfy: [ :p | p name = 'foo' ]
]

{ #category : #'as yet unclassified' }
PP2NamedChildrenVisitorTest >> testDelegateExcludeSelf [
	named := 'foo' asPParser
		name: 'foo';
		yourself.
		
	parser := named wrapped
		name: 'self';
		yourself.
		
	self visit: parser.
	
	self assert: result size equals: 1.
	self assert: result anySatisfy: [ :p | p name = 'foo' ]
]

{ #category : #'as yet unclassified' }
PP2NamedChildrenVisitorTest >> testLiteralObject [
	parser := $a asPParser.
	
	self visit: parser.
	
	self assert: result isEmpty.
]

{ #category : #'as yet unclassified' }
PP2NamedChildrenVisitorTest >> visit: node [
	^ result := PP2NamedChildrenVisitor new visit: node
]
