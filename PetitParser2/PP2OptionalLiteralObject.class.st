Class {
	#name : #PP2OptionalLiteralObject,
	#superclass : #PP2Optional,
	#instVars : [
		'character'
	],
	#category : 'PetitParser2-Strategies'
}

{ #category : #initialization }
PP2OptionalLiteralObject >> initializeFor: aPP2Node [
	super initializeFor: aPP2Node.
	character := node child literal
]

{ #category : #parsing }
PP2OptionalLiteralObject >> parseOn: aPP2Context [
	^ (aPP2Context peek == character) ifTrue: [ 
		aPP2Context uncheckedNext 
	] ifFalse: [  
		nil
	]
]
