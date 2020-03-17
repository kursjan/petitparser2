Class {
	#name : #PP2SequenceOfThree,
	#superclass : #PP2Sequence,
	#instVars : [
		'firstChild',
		'secondChild',
		'thirdChild'
	],
	#category : 'PetitParser2-Strategies'
}

{ #category : #initialization }
PP2SequenceOfThree >> initializeFor: aPP2SequenceNode [
	super initializeFor: aPP2SequenceNode.
	
	firstChild := aPP2SequenceNode firstChild.
	secondChild := aPP2SequenceNode secondChild.
	thirdChild := aPP2SequenceNode thirdChild.
]

{ #category : #parsing }
PP2SequenceOfThree >> parseOn: context [
	| retval elements memento |
	memento := self remember: context.
	(retval := firstChild parseOn: context) isPetit2Failure ifTrue: [ 
		^ retval
	].
	elements := Array new: 3.
	elements at: 1 put: retval.
	
	(retval := secondChild parseOn: context) isPetit2Failure ifTrue: [ 
		self restore: context from: memento.
		^ retval
	].
	elements at: 2 put: retval.

	(retval := thirdChild parseOn: context) isPetit2Failure ifTrue: [ 
		self restore: context from: memento.
		^ retval
	].
	elements at: 3 put: retval.
	
	^ elements
]
