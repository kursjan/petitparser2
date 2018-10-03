Class {
	#name : #PP2MappingOfTwo,
	#superclass : #PP2Mapping,
	#category : 'PetitParser2-Strategies'
}

{ #category : #parsing }
PP2MappingOfTwo >> parseOn: context [
	| retval |
	^ (retval := node child parseOn: context) isPetit2Success
		ifTrue: [ node block value: (retval at: 1) value: (retval at: 2)  ]
		ifFalse: [ retval ]
]
