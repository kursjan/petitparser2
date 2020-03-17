"
Adapter from stream of bytes (stream is the instance varaible) to stream of characters.  Encoder (instance variable) translates incoming bytes into characters. 

Can be used to convert Zinc byte streams:
	byteStream := ZnClient new
 		url: 'http://pharo.org';
  		streaming: true;
  		get.
	stream := PP2CharacterStream on: byteStream encoder: ZnUTF8Encoder new.
	
Call #asPetit2Stream to convert to the interface accepted by PP2Node>>parse:
"
Class {
	#name : #PP2CharacterStream,
	#superclass : #Stream,
	#instVars : [
		'stream',
		'encoder'
	],
	#category : #'PetitParser2-Streams'
}

{ #category : #'instance creation' }
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
