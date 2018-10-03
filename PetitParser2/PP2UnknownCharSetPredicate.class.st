Class {
	#name : #PP2UnknownCharSetPredicate,
	#superclass : #Object,
	#classInstVars : [
		'instance'
	],
	#category : 'PetitParser2-Tools'
}

{ #category : #'as yet unclassified' }
PP2UnknownCharSetPredicate class >> instance [
	instance isNil ifTrue: [ 
		instance := PP2UnknownCharSetPredicate new
	].
	^ instance
]

{ #category : #testing }
PP2UnknownCharSetPredicate >> isUnknown [
	^ true
]

{ #category : #accessing }
PP2UnknownCharSetPredicate >> value: aCharacter [
	self error: 'I don''t know, sorry man :('
]
