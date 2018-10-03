Class {
	#name : #PP2NextSetsVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'parser',
		'visitor',
		'nextSet',
		'eoi',
		'nextParser'
	],
	#category : 'PetitParser2-Tests-Analysis'
}

{ #category : #accessing }
PP2NextSetsVisitorTest >> assert: aSet includes: anObject [
	self assert: (aSet includes: anObject)
]

{ #category : #accessing }
PP2NextSetsVisitorTest >> nextSet: node in: root [
	visitor visit: root.
	^ nextSet := visitor nextSets at: node
]

{ #category : #accessing }
PP2NextSetsVisitorTest >> setUp [
	visitor := PP2NextSetsVisitor new.
	eoi := visitor instVarNamed: #eoi.
]

{ #category : #accessing }
PP2NextSetsVisitorTest >> testAction [
	| action |
	parser := $a asPParser.
	action := parser ==> [:e | e].
	
	self nextSet: parser in: action.

	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
	
	self nextSet: action in: action.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
]

{ #category : #accessing }
PP2NextSetsVisitorTest >> testChoice [
	| choice |
	parser := $a asPParser.
	choice := parser / parser wrapped.
	
	self nextSet: parser in: choice.
	
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
]

{ #category : #accessing }
PP2NextSetsVisitorTest >> testDelegate [
	| delegate |
	parser := $a asPParser.
	delegate := parser wrapped.
	
	self nextSet: parser in: delegate.

	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
	
	self nextSet: delegate in: delegate.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
]

{ #category : #accessing }
PP2NextSetsVisitorTest >> testEpsilon [
	parser := nil asPParser.
	
	self nextSet: parser in: parser.
	
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
]

{ #category : #accessing }
PP2NextSetsVisitorTest >> testFlatten [
	| flatten |
	parser := $a asPParser.
	flatten := parser flatten.
	
	self nextSet: parser in: flatten.

	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
	
	self nextSet: flatten in: flatten.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
]

{ #category : #accessing }
PP2NextSetsVisitorTest >> testLiteralObject [
	parser := $a asPParser.
	
	self nextSet: parser in: parser.
	
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
]

{ #category : #accessing }
PP2NextSetsVisitorTest >> testLiteralSequence [
	parser := 'foo' asPParser.
	
	self nextSet: parser in: parser.
	
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
]

{ #category : #accessing }
PP2NextSetsVisitorTest >> testOptional [
	| optional |
	parser := $a asPParser.
	optional := parser optional.
	
	self nextSet: parser in: optional.
	
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
]

{ #category : #accessing }
PP2NextSetsVisitorTest >> testPossesiveRepeating [
	| plus |
	parser := $a asPParser.
	plus := parser plus.
	
	self nextSet: parser in: plus.

	self assert: nextSet size equals: 2.
	self assert: nextSet includes: eoi.
	
	self nextSet: plus in: plus.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
]

{ #category : #accessing }
PP2NextSetsVisitorTest >> testRoot [
	parser := $a asPParser.
	
	self nextSet: parser in: parser.
	
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
]

{ #category : #accessing }
PP2NextSetsVisitorTest >> testSequence [
	| sequence |
	parser := $a asPParser.
	nextParser := $b asPParser.
	
	sequence := parser, nextParser.
	
	self nextSet: parser in: sequence.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: nextParser.

	self nextSet: nextParser in: sequence.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
	
	
	self nextSet: sequence in: sequence.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
]

{ #category : #accessing }
PP2NextSetsVisitorTest >> testSequenceOfDelegates [
	| sequence |
	parser := $a asPParser.
	nextParser := $b asPParser wrapped.
	
	sequence := parser wrapped, nextParser.
	
	self nextSet: parser in: sequence.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: nextParser.
	
	self nextSet: nextParser in: sequence.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
	
	self nextSet: sequence in: sequence.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
]

{ #category : #accessing }
PP2NextSetsVisitorTest >> testSequenceOfThree [
	| sequence nextNextParser |
	parser := $a asPParser.
	nextParser := $b asPParser.
	nextNextParser := $c asPParser.
	
	sequence := parser, nextParser, nextNextParser.
	
	self nextSet: parser in: sequence.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: nextParser.
	
	self nextSet: nextParser in: sequence.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: nextNextParser.
	
	self nextSet: nextNextParser in: sequence.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
	
	self nextSet: sequence in: sequence.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
]

{ #category : #accessing }
PP2NextSetsVisitorTest >> testSequenceOfThreeWithNullable [
	| sequence nextNextParser |
	parser := $a asPParser.
	nextParser := $b asPParser optional.
	nextNextParser := $c asPParser.
	
	sequence := parser, nextParser, nextNextParser.
	
	self nextSet: parser in: sequence.
	self assert: nextSet size equals: 2.
	self assert: nextSet includes: nextParser.
	self assert: nextSet includes: nextNextParser.
	
	self nextSet: nextParser in: sequence.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: nextNextParser.
	
	self nextSet: nextNextParser in: sequence.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
	
	self nextSet: sequence in: sequence.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
]

{ #category : #accessing }
PP2NextSetsVisitorTest >> testSequenceOptional [
	| sequence |
	parser := $a asPParser.
	nextParser := $b asPParser optional.
	
	sequence := parser, nextParser.
	
	self nextSet: parser in: sequence.
	
	self assert: nextSet size equals: 2.
	self assert: nextSet includes: nextParser.
	self assert: nextSet includes: eoi.	
	
	self nextSet: sequence in: sequence.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
]

{ #category : #accessing }
PP2NextSetsVisitorTest >> testToken [
	| token |
	parser := $a asPParser.
	token := parser token.
	
	self nextSet: parser in: token.

	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
	
	self nextSet: token in: token.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
]

{ #category : #accessing }
PP2NextSetsVisitorTest >> testTrim [
	| trim |
	parser := $a asPParser.
	trim := parser trim.
	
	self nextSet: parser in: trim.

	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
	
	self nextSet: trim in: trim.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
]

{ #category : #accessing }
PP2NextSetsVisitorTest >> testTrimmingToken [
	| token |
	parser := $a asPParser.
	token := parser token trim.
	
	self nextSet: parser in: token.

	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
	
	self nextSet: token in: token.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
]
