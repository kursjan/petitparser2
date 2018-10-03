Class {
	#name : #PP2EndOfInput,
	#superclass : #PP2Strategy,
	#instVars : [
		'failure'
	],
	#category : 'PetitParser2-Strategies'
}

{ #category : #'as yet unclassified' }
PP2EndOfInput >> initializeFor: aPP2Node [
	super initializeFor: aPP2Node.
	
	failure := PP2Failure message: 'end of input expected'
]

{ #category : #parsing }
PP2EndOfInput >> parseOn: context [
	^ context atEnd ifTrue: [ nil ] ifFalse: [ failure context: context ]
]
