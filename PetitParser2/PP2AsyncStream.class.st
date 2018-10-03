"
TODO: Find a better name for this.

I represent a stream which is filled by some other input that comes  asynchronously.

E.g. keyboard  keyboard source can queue the characters that can be read by parser.
"
Class {
	#name : #PP2AsyncStream,
	#superclass : #Object,
	#instVars : [
		'queue',
		'closed'
	],
	#category : 'PetitParser2-Streams'
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
	delay := Delay forMilliseconds: 50.
	
	[ queue isEmpty] whileTrue: [ delay wait  ].
	^  queue removeFirst
]

{ #category : #events }
PP2AsyncStream >> queueChar: aCharacter [
	closed ifFalse: [  queue addLast: aCharacter ]

]
