Class {
	#name : #PP2Wrapping,
	#superclass : #PP2Strategy,
	#category : 'PetitParser2-Strategies'
}

{ #category : #parsing }
PP2Wrapping >> parseOn: aPP2Context [
	^ node block value: aPP2Context value: [ node child parseOn: aPP2Context ]
]
