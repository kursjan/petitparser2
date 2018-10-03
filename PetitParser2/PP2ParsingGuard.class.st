Class {
	#name : #PP2ParsingGuard,
	#superclass : #PP2WrappingStrategy,
	#instVars : [
		'classification',
		'retval'
	],
	#category : 'PetitParser2-Strategies'
}

{ #category : #accessing }
PP2ParsingGuard >> classification [
	^ classification 
]

{ #category : #accessing }
PP2ParsingGuard >> classification: anArray [
	"I am experimenting with smaller classification, but not 100% sure this improves performance"
	classification := (anArray copyFrom: 1 to: 128)
]

{ #category : #parsing }
PP2ParsingGuard >> parseOn: context [
	| intValue |
	context atEnd ifTrue: [ ^ retval ].

	intValue := context uncheckedPeek asInteger.
	(intValue between: 0 and: 128) ifFalse: [  
		^ strategy parseOn: context
	].
	
	(classification at: intValue) ifFalse: [ 
		^ retval
	].

	^ strategy parseOn: context


]

{ #category : #conversion }
PP2ParsingGuard >> parsingGuard: anArray [
	self assert: classification = (anArray copyFrom: 1 to: classification size).
	^ self
]

{ #category : #accessing }
PP2ParsingGuard >> retval [
	^ retval 
]

{ #category : #accessing }
PP2ParsingGuard >> retval: anObject [
	retval := anObject
]
