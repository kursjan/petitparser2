Class {
	#name : #PP2LiteralObject,
	#superclass : #PP2Strategy,
	#category : 'PetitParser2-Strategies'
}

{ #category : #parsing }
PP2LiteralObject >> initializeFor: aPP2Node [
	super initializeFor: aPP2Node
]

{ #category : #parsing }
PP2LiteralObject >> parseOn: aPP2Context [
	| literal |
	literal := node literal.
	
	^ (aPP2Context nextFor: literal)
		ifTrue: [ literal ]
		ifFalse: [ PP2Failure message: node message context: aPP2Context ]
		
]
