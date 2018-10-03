Class {
	#name : #PP2Failure,
	#superclass : #Object,
	#traits : 'TPP2Debuggable',
	#classTraits : 'TPP2Debuggable classTrait',
	#instVars : [
		'position',
		'message',
		'context',
		'debugResult',
		'parser'
	],
	#category : 'PetitParser2-Core'
}

{ #category : #'instance creation' }
PP2Failure class >> message: aString [
	^ (self new )
		message: aString;
		position: 0
		
]

{ #category : #'instance creation' }
PP2Failure class >> message: aString context: aPP2Context [
	^ self basicNew message: aString position: aPP2Context position
]

{ #category : #accessing }
PP2Failure >> context: aPP2Context [
	self flag: 'TODO FIX: so far use #setContext: as a setter'.
	position := aPP2Context position
]

{ #category : #debugging }
PP2Failure >> debugResult [
	^ context debugResult
]

{ #category : #accessing }
PP2Failure >> furthestPosition [
	^ context furthestPosition
]

{ #category : #testing }
PP2Failure >> isPetit2Failure [
	^ true
]

{ #category : #testing }
PP2Failure >> isPetit2Success [
	^ false
]

{ #category : #accessing }
PP2Failure >> message [
	^ message
]

{ #category : #accessing }
PP2Failure >> message: anObject [
	message := anObject
]

{ #category : #accessing }
PP2Failure >> message: aString position: anInteger [
	message := aString.
	position := anInteger
]

{ #category : #accessing }
PP2Failure >> parser [
	^ context parser
]

{ #category : #accessing }
PP2Failure >> position [
	^ position
]

{ #category : #accessing }
PP2Failure >> position: anObject [
	position := anObject
]

{ #category : #printing }
PP2Failure >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ': '.
	self message printOn: aStream 
]

{ #category : #accessing }
PP2Failure >> returnValue [
	^ self
]

{ #category : #accessing }
PP2Failure >> setContext: aPP2Context [
	context := aPP2Context
]
