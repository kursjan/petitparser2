"
I provide a bare minimum of methods required by PP2 to be parsed:
- atEnd
- next

I can be converted to PP2Stream using the #asPetit2Stream
"
Class {
	#name : #PP2MinimalStream,
	#superclass : #Stream,
	#instVars : [
		'values',
		'position'
	],
	#category : 'PetitParser2-Tests-Streams'
}

{ #category : #'as yet unclassified' }
PP2MinimalStream class >> on: values [
	^ self basicNew 
		initialize;
		values: values;
		yourself
]

{ #category : #'minimal interface' }
PP2MinimalStream >> atEnd [
	^ position == values size
]

{ #category : #private }
PP2MinimalStream >> contents [
	^ values
]

{ #category : #initialization }
PP2MinimalStream >> initialize [
	position := 0.
]

{ #category : #'minimal interface' }
PP2MinimalStream >> next [
	position := position + 1.
	^ values at: position
]

{ #category : #private }
PP2MinimalStream >> values: anObject [
	values := anObject
]
