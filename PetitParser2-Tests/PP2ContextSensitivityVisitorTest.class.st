Class {
	#name : #PP2ContextSensitivityVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'parser',
		'visitor'
	],
	#category : 'PetitParser2-Tests-Analysis'
}

{ #category : #asserting }
PP2ContextSensitivityVisitorTest >> assertIsContextSensitive: node [
	self assert: (visitor visit: node) description: 'should be context sensitive'
]

{ #category : #asserting }
PP2ContextSensitivityVisitorTest >> denyIsContextSensitive: node [
	self deny: (visitor visit: node) description: 'should not be context sensitive'
]

{ #category : #running }
PP2ContextSensitivityVisitorTest >> setUp [
	visitor := PP2ContextSensitivityVisitor new
]

{ #category : #tests }
PP2ContextSensitivityVisitorTest >> testAndMatch [
	parser := $a asPParser match and.
	
	self assertIsContextSensitive: parser.
]

{ #category : #tests }
PP2ContextSensitivityVisitorTest >> testLiteralObject [
	parser := $a asPParser.
	
	self denyIsContextSensitive: parser.
]

{ #category : #tests }
PP2ContextSensitivityVisitorTest >> testMatch [
	parser := $a asPParser match.
	
	self assertIsContextSensitive: parser.
]

{ #category : #tests }
PP2ContextSensitivityVisitorTest >> testSea [
	parser := $a asPParser sea.
	
	self denyIsContextSensitive: parser.
]

{ #category : #tests }
PP2ContextSensitivityVisitorTest >> testSeaWithCSIsland [
	parser := $a asPParser match sea.
	
	self assertIsContextSensitive: parser.
]

{ #category : #tests }
PP2ContextSensitivityVisitorTest >> testSequence [
	parser := $a asPParser, $b asPParser.
	
	self denyIsContextSensitive: parser.
]

{ #category : #tests }
PP2ContextSensitivityVisitorTest >> testSequenceWithMatch [
	parser := $a asPParser, $b asPParser match.
	
	self assertIsContextSensitive: parser.
]

{ #category : #tests }
PP2ContextSensitivityVisitorTest >> testSequenceWithPush [
	parser := #letter asPParser, #letter asPParser push.
	
	self denyIsContextSensitive: parser.
]

{ #category : #tests }
PP2ContextSensitivityVisitorTest >> testSequenceWithPushMatch [
	parser := (#letter asPParser push), (#letter asPParser match).
	
	self denyIsContextSensitive: parser.
]

{ #category : #tests }
PP2ContextSensitivityVisitorTest >> testSequenceWithPushMatchPop [
	parser := (#letter asPParser push), (#letter asPParser match), (#letter asPParser pop).
	
	self denyIsContextSensitive: parser.
]
