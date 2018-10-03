Class {
	#name : #PP2Star,
	#superclass : #PP2PossesiveRepeating,
	#instVars : [
		'child'
	],
	#category : 'PetitParser2-Strategies'
}

{ #category : #transformations }
PP2Star >> bypass: aChild to: target [
	self assert: aChild == child.
	
	child := target
]

{ #category : #accessing }
PP2Star >> child [
	^ child
]

{ #category : #parsing }
PP2Star >> initializeFor: aNode [
	super initializeFor: aNode.
	child := aNode child
]

{ #category : #parsing }
PP2Star >> parseOn: aPP2Context [
	| elements retval |
	elements := OrderedCollection new.
	
	node max timesRepeat: [
		(retval := child parseOn: aPP2Context) isPetit2Failure ifTrue: [
			^ elements
		].
		elements addLast: retval 
	].
	
	^ elements
]

{ #category : #'as yet unclassified' }
PP2Star >> parsingGuard: classification [
	^ (super parsingGuard: classification)
		retval: #();
		yourself
]
