"
I am an adapter from stream of bytes (stream instance varaible) to stream of characters. I use encoder (instance variable) to translate these bytes into characters.
"
Class {
	#name : #PP2CharacterStream,
	#superclass : #Stream,
	#instVars : [
		'stream',
		'encoder'
	],
	#category : 'PetitParser2-Streams'
}

{ #category : #'as yet unclassified' }
PP2CharacterStream class >> on: stream encoder: encoder [
	^ (self basicNew initialize)
		stream: stream;
		encoder: encoder;
		yourself
]

{ #category : #accessing }
PP2CharacterStream >> atEnd [
	^ stream atEnd
]

{ #category : #accessing }
PP2CharacterStream >> encoder [
	^ encoder
]

{ #category : #accessing }
PP2CharacterStream >> encoder: anObject [
	encoder := anObject
]

{ #category : #accessing }
PP2CharacterStream >> next [
	^ (encoder nextCodePointFromStream: stream) asCharacter
]

{ #category : #accessing }
PP2CharacterStream >> stream [
	^ stream
]

{ #category : #accessing }
PP2CharacterStream >> stream: anObject [
	stream := anObject
]
