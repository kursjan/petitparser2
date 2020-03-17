Class {
	#name : #PP2RecognizerContext,
	#superclass : #PP2NoopContext,
	#instVars : [
		'inToken',
		'parent'
	],
	#category : 'PetitParser2-Optimizations'
}

{ #category : #comparing }
PP2RecognizerContext >> = anotherContext [
	super = anotherContext ifFalse: [ ^ false ]	.

	(self inToken == anotherContext inToken) ifFalse: [ ^ false ].
	(self parent == anotherContext parent) ifFalse: [ ^ false ].
	
	^ true
]

{ #category : #comparing }
PP2RecognizerContext >> hash [
	^ super hash bitXor: (self inToken hash bitXor: self parent identityHash)
]

{ #category : #accessing }
PP2RecognizerContext >> inToken [
	^ inToken
]

{ #category : #accessing }
PP2RecognizerContext >> inToken: anObject [
	inToken := anObject
]

{ #category : #accessing }
PP2RecognizerContext >> parent [
	^ parent
]

{ #category : #accessing }
PP2RecognizerContext >> parent: anObject [
	parent := anObject
]
