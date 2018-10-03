Class {
	#name : #PP2Plus,
	#superclass : #PP2PossesiveRepeating,
	#instVars : [
		'child'
	],
	#category : 'PetitParser2-Strategies'
}

{ #category : #accessing }
PP2Plus >> bypass: aChild to: target [
	self assert: aChild == child.
	
	child := target
]

{ #category : #accessing }
PP2Plus >> child [
	^ child
]

{ #category : #initialization }
PP2Plus >> initializeFor: aNode [
	super initializeFor: aNode.
	child := aNode child
]

{ #category : #parsing }
PP2Plus >> parseOn: aPP2Context [
	| elements retval |
	
	(retval := child parseOn: aPP2Context) isPetit2Failure ifTrue: [
		^ retval
	].
	elements := OrderedCollection with: retval.
	
	(node max - 1) timesRepeat: [
	 	(retval := child parseOn: aPP2Context) isPetit2Failure ifTrue: [ 
			^ elements 
		].
		elements addLast: retval 
	].

	^ elements
]

{ #category : #conversion }
PP2Plus >> recognizer [
	^ PP2PlusRecognizer on: self node
]
