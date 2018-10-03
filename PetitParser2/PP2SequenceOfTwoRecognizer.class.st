Class {
	#name : #PP2SequenceOfTwoRecognizer,
	#superclass : #PP2Sequence,
	#instVars : [
		'firstChild',
		'secondChild'
	],
	#category : 'PetitParser2-Strategies'
}

{ #category : #transformation }
PP2SequenceOfTwoRecognizer >> bypass: child to: target [
	firstChild == child ifTrue: [ firstChild := target ].
	secondChild == child ifTrue: [ secondChild := target ]
]

{ #category : #'as yet unclassified' }
PP2SequenceOfTwoRecognizer >> firstChild [
	^ firstChild
]

{ #category : #initialization }
PP2SequenceOfTwoRecognizer >> initializeFor: aPP2SequenceNode [
	super initializeFor: aPP2SequenceNode.
	
	firstChild := aPP2SequenceNode firstChild.
	secondChild := aPP2SequenceNode secondChild.
]

{ #category : #parsing }
PP2SequenceOfTwoRecognizer >> parseOn: context [
	| retval memento |
	memento := self remember: context.
	(retval := firstChild parseOn: context) isPetit2Failure ifTrue: [ 
		^ retval
	].

	(retval := secondChild parseOn: context) isPetit2Failure ifTrue: [ 
		self restore: context from: memento.
		^ retval
	].
]

{ #category : #'as yet unclassified' }
PP2SequenceOfTwoRecognizer >> secondChild [
	^ secondChild
]
