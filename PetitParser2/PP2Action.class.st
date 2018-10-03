Class {
	#name : #PP2Action,
	#superclass : #PP2Strategy,
	#category : 'PetitParser2-Strategies'
}

{ #category : #parsing }
PP2Action >> parseOn: aPP2Context [
	| retval |
	^ (retval := node child parseOn: aPP2Context) isPetit2Success
		ifTrue: [ node block value: retval  ]
		ifFalse: [ retval ]
]
