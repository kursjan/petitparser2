Class {
	#name : #PP2AndLiteralObject,
	#superclass : #PP2And,
	#instVars : [
		'literal'
	],
	#category : 'PetitParser2-Strategies'
}

{ #category : #initialization }
PP2AndLiteralObject >> initializeFor: aNode [
	super initializeFor: aNode.
	literal := aNode child literal
]

{ #category : #parsing }
PP2AndLiteralObject >> parseOn: context [
	^ (context peek == literal )
		ifTrue: [ literal ] 
		ifFalse: [ PP2Failure message: 'literal expected' context: context ]
]
