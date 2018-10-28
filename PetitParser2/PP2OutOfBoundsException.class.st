Class {
	#name : #PP2OutOfBoundsException,
	#superclass : #Error,
	#instVars : [
		'subscript'
	],
	#category : #'PetitParser2-Core'
}

{ #category : #signalling }
PP2OutOfBoundsException class >> signalFor: subscript [
	^ (self new)
		signalFor: subscript;
		signal

]

{ #category : #signalling }
PP2OutOfBoundsException >> signalFor: anInteger [
	subscript := anInteger
]
