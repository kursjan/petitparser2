"
Implementation of stream filled by asynchronous input. Can be converted to PP2Stream by calling asPetit2Stream to be parsed by PetitParser2.

For example, keyboard source can be used as an input to PetitParser2.
"
Class {
	#name : #PP2AsyncStream,
	#superclass : #Object,
	#instVars : [
		'queue',
		'closed'
	],
	#category : #'PetitParser2-Streams'
}

{ #category : #converting }
PP2AsyncStream >> asPetit2Stream [
	^ PP2BufferStream on: self
]

{ #category : #'minimal interface' }
PP2AsyncStream >> atEnd [
	^ queue isEmpty and: closed
]

{ #category : #'initialize-release' }
PP2AsyncStream >> close [
	closed := true.
	"I need to queue some character at the end, because next is waiting for an input"
	queue addLast: (Character codePoint: 4).
]

{ #category : #initialization }
PP2AsyncStream >> initialize [
	super initialize.
	
	closed := false.
	queue := OrderedCollection new.	
]

{ #category : #'minimal interface' }
PP2AsyncStream >> next [
	| delay |
	"
		Poor man implementation of polling...
	"
	delay := Delay forMilliseconds: 50.
	
	[ queue isEmpty] whileTrue: [ delay wait  ].
	^  queue removeFirst
]

{ #category : #events }
PP2AsyncStream >> queueChar: aCharacter [
	closed ifFalse: [  queue addLast: aCharacter ]

]
