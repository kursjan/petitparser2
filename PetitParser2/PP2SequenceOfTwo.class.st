Class {
	#name : #PP2SequenceOfTwo,
	#superclass : #PP2Sequence,
	#instVars : [
		'firstChild',
		'secondChild'
	],
	#category : 'PetitParser2-Strategies'
}

{ #category : #transformation }
PP2SequenceOfTwo >> bypass: child to: target [
	firstChild == child ifTrue: [ firstChild := target ].
	secondChild == child ifTrue: [ secondChild := target ]
]

{ #category : #accessing }
PP2SequenceOfTwo >> firstChild [
	^ firstChild
]

{ #category : #initialization }
PP2SequenceOfTwo >> initializeFor: aPP2SequenceNode [
	super initializeFor: aPP2SequenceNode.
	
	firstChild := aPP2SequenceNode firstChild.
	secondChild := aPP2SequenceNode secondChild.
]

{ #category : #parsing }
PP2SequenceOfTwo >> parseOn: context [
	| retval elements memento |
	memento := self remember: context.
	(retval := firstChild parseOn: context) isPetit2Failure ifTrue: [ 
		^ retval
	].
	elements := Array new: 2.
	elements at: 1 put: retval.
	
	(retval := secondChild parseOn: context) isPetit2Failure ifTrue: [ 
		self restore: context from: memento.
		^ retval
	].
	elements at: 2 put: retval.

	^ elements
]

{ #category : #conversion }
PP2SequenceOfTwo >> recognizer [
	^ PP2SequenceOfTwoRecognizer on: self node
]

{ #category : #accessing }
PP2SequenceOfTwo >> secondChild [
	^ secondChild
]
