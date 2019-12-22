"
Represents unknown set of characters. For example, start of line node does not consume any character and therefore char set optimization cannot be used to quickly fail the parsing. See PP2CharSetPredicate.
"
Class {
	#name : #PP2UnknownCharSetPredicate,
	#superclass : #Object,
	#classInstVars : [
		'instance'
	],
	#category : #'PetitParser2-Tools'
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
