Class {
	#name : #PP2RecognizerVisitorTest,
	#superclass : #TestCase,
	#traits : 'TPP2TypeAssertions',
	#classTraits : 'TPP2TypeAssertions classTrait',
	#instVars : [
		'parser',
		'visitor',
		'token',
		'sequence'
	],
	#category : 'PetitParser2-Tests-Optimizations'
}

{ #category : #running }
PP2RecognizerVisitorTest >> setUp [
	visitor := PP2RecognizerVisitor new
]

{ #category : #tests }
PP2RecognizerVisitorTest >> testFlatten [
	| flattened |
	parser := #letter asPParser star.
	parser strategy: (PP2StarPredicateObject on: parser).
	flattened := parser flatten.
	
	self visit: flattened.
	
	self assert: parser strategy isKindOf: PP2StarPredicateObjectRecognizer 
]

{ #category : #tests }
PP2RecognizerVisitorTest >> testPredicateObject [
	parser := #letter asPParser.
	token := parser token.
	
	self visit: token.
	
	self assert: parser strategy isKindOf: PP2PredicateObjectRecognizer  
]

{ #category : #tests }
PP2RecognizerVisitorTest >> testSequenceOfTwo [
	parser := $a asPParser, $b asPParser.
	parser strategy: (PP2SequenceOfTwo on: parser).
	token := parser token.
	
	self visit: token.
	
	self assert: parser strategy isKindOf: PP2SequenceOfTwoRecognizer 
]

{ #category : #tests }
PP2RecognizerVisitorTest >> testToken [
	parser := #letter asPParser star.
	parser strategy: (PP2StarPredicateObject on: parser).
	token := parser token.
	
	self visit: token.
	
	self assert: parser strategy isKindOf: PP2StarPredicateObjectRecognizer 
]

{ #category : #tests }
PP2RecognizerVisitorTest >> testTwoParents [
	parser := #letter asPParser star.
	parser strategy: (PP2StarPredicateObject on: parser).

	token := parser token.
	sequence := token, parser.
	
	self visit: sequence.
	
	self assert: parser warnings size equals: 1.
	self assert: parser strategy isKindOf: PP2StarPredicateObject.
]

{ #category : #tests }
PP2RecognizerVisitorTest >> testTwoParentsDifferentContext [
	| wrapped |
	parser := #letter asPParser star.
	parser strategy: (PP2StarPredicateObject on: parser).
	wrapped := parser wrapped.

	token := wrapped token.
	sequence := wrapped, token.
	
	self visit: sequence.
	
	self assert: parser warnings size equals: 1.
	self assert: parser strategy isKindOf: PP2StarPredicateObject.
]

{ #category : #tests }
PP2RecognizerVisitorTest >> testTwoParentsNoWarning [
	| tokenOne tokenTwo |
	parser := #letter asPParser star.
	parser strategy: (PP2StarPredicateObject on: parser).

	tokenOne := parser token.
	tokenTwo := parser token.
	sequence := tokenOne, tokenTwo.
	
	self visit: sequence.
	
	self assert: parser warnings isEmpty.
	self assert: parser strategy isKindOf: PP2StarPredicateObjectRecognizer.
]

{ #category : #support }
PP2RecognizerVisitorTest >> visit: node [
	visitor doPass: node
]
