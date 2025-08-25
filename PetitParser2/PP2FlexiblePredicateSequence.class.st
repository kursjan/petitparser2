Class {
	#name : #PP2FlexiblePredicateSequence,
	#superclass : #PP2Strategy,
	#category : #'PetitParser2-Strategies'
}

{ #category : #parsing }
PP2FlexiblePredicateSequence >> parseOn: aPP2Context [
	| position result |
	position := aPP2Context position.
	result := String streamContents: [ :out |
		[ node condition value: aPP2Context peek ] whileTrue: [ out nextPut: aPP2Context next ] ].
	(node predicate value: result)
		ifTrue: [ ^ result ].
	aPP2Context position: position.
	^ PP2Failure message: node predicateMessage context: aPP2Context
]
