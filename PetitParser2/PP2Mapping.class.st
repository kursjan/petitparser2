Class {
	#name : #PP2Mapping,
	#superclass : #PP2Strategy,
	#category : 'PetitParser2-Strategies'
}

{ #category : #parsing }
PP2Mapping >> parseOn: aPP2Context [
	| retval |
	^ (retval := node child parseOn: aPP2Context) isPetit2Success
		ifTrue: [ node block valueWithArguments: retval asMapArgument ]
		ifFalse: [ retval ]
]
