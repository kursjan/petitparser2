Class {
	#name : #PP2SmalltalkToken,
	#superclass : #PP2Token,
	#instVars : [
		'comments'
	],
	#category : 'PetitParser2-Smalltalk-Core'
}

{ #category : #accessing }
PP2SmalltalkToken >> comments [
	^ comments ifNil: [ #() ]
]

{ #category : #accessing }
PP2SmalltalkToken >> comments: anArray [
	comments := anArray
]

{ #category : #compatiblity }
PP2SmalltalkToken >> length [
	^ self size
]
