Class {
	#name : #PP2FlexiblePredicateTest,
	#superclass : #TestCase,
	#category : #'PetitParser2-Tests-Nodes'
}

{ #category : #tests }
PP2FlexiblePredicateTest >> test1 [
	| parser |
	parser := PP2FlexiblePredicateSequenceNode
		on: [ :value | Object new respondsTo: value asSymbol ]
		message: 'message to an object'
		while: [ :e | e ~= Character space ].
	
	self assert: (parser parse: 'hash ijk') isPetit2Failure not.
	self assert: (parser parse: '99 ijk') isPetit2Failure
]
