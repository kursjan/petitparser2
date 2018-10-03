Class {
	#name : #PP2Adaptable,
	#superclass : #PP2Strategy,
	#category : 'PetitParser2-Strategies'
}

{ #category : #parsing }
PP2Adaptable >> parseOn: context [
	^ node child parseOn: context
]
