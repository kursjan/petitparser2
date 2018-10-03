Class {
	#name : #PP2Failing,
	#superclass : #PP2Strategy,
	#category : 'PetitParser2-Strategies'
}

{ #category : #parsing }
PP2Failing >> parseOn: aPP2Context [
	^ PP2Failure message: 'failure' context: aPP2Context
]
