Class {
	#name : #PP2NotLiteralObject,
	#superclass : #PP2Not,
	#instVars : [
		'literal'
	],
	#category : 'PetitParser2-Strategies'
}

{ #category : #initialization }
PP2NotLiteralObject >> initializeFor: aNode [
	super initializeFor: aNode.
	literal := aNode child literal
]

{ #category : #parsing }
PP2NotLiteralObject >> parseOn: context [
	^ (context peek == literal )
		ifFalse: [ nil ] 
		ifTrue: [ PP2Failure message: 'literal expected' context: context ]
]
