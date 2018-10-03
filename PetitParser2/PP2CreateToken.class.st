Class {
	#name : #PP2CreateToken,
	#superclass : #PP2Strategy,
	#category : 'PetitParser2-Strategies'
}

{ #category : #parsing }
PP2CreateToken >> parseOn: aPP2Context [
	| start retval |
	start := aPP2Context position.
	(retval := node child parseOn: aPP2Context) isPetit2Failure ifTrue: [ ^ retval ].

	^ aPP2Context newToken: (node tokenClass) from: start
]
