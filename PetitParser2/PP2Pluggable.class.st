Class {
	#name : #PP2Pluggable,
	#superclass : #PP2Strategy,
	#category : 'PetitParser2-Strategies'
}

{ #category : #parsing }
PP2Pluggable >> parseOn: aPP2Context [
	^ node block value: aPP2Context
]
