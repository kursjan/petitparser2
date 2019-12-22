"
PP2 Wrapper around stream. Contains additional state to used by PP2.
"
Class {
	#name : #PP2Context,
	#superclass : #Object,
	#traits : 'TPP2Globals + TPP2Properties + TPP2Debuggable + TPP2Context',
	#classTraits : 'TPP2Globals classTrait + TPP2Properties classTrait + TPP2Debuggable classTrait + TPP2Context classTrait',
	#instVars : [
		'stream',
		'position',
		'parser',
		'globals',
		'returnValue',
		'startMemento',
		'properties'
	],
	#category : #'PetitParser2-Core'
}

{ #category : #'instance creation' }
PP2Context class >> on: stream [
	^ self on: stream position: 0
]

{ #category : #'instance creation' }
PP2Context class >> on: stream position: position [
	^ self new 
		stream: stream;
		position: position;
		yourself
]

{ #category : #converting }
PP2Context >> asPositionableStream [
	^ (ReadStream on: stream collection)
		position: position;
		yourself
]

{ #category : #'stream mimicry' }
PP2Context >> atEnd [
	^ stream atEnd: position
]

{ #category : #accessing }
PP2Context >> contents [
	^ stream contents
]

{ #category : #copying }
PP2Context >> copyFrom: start to: end [
	^ stream copyFrom: start to: end
]

{ #category : #debugging }
PP2Context >> debugResult [
	^ self globalAt: #debugResult ifAbsentPut: [ 
		| context |
		context := self copy.
		context restore: self startMemento.
		context parser duplicate enableDebug parseWithContext: context.
		context currentDebugResult
	]
]

{ #category : #'accessing-globals' }
PP2Context >> globals [
	^ globals
]

{ #category : #'accessing-globals' }
PP2Context >> globals: anObject [
	^ globals := anObject
]

{ #category : #initialization }
PP2Context >> initialize [
	super initialize
]

{ #category : #testing }
PP2Context >> isPetit2Context [
	^ true
]

{ #category : #tokenization }
PP2Context >> newToken: tokenClass from: start [
	^ stream newToken: tokenClass from: start + 1 to: position
]

{ #category : #'stream mimicry' }
PP2Context >> next [
	^ (stream atEnd: position) not ifTrue: [ 
		position := position + 1.
		stream atPosition: position
	] ifFalse: [  
		nil
	]
]

{ #category : #'stream mimicry' }
PP2Context >> next: size [
	^ ((stream atEnd: position + size - 1) not) ifTrue: [ 
		stream copyFrom: (position + 1) to: (position := position + size)
	] ifFalse: [ 
		nil
	]
]

{ #category : #'stream mimicry' }
PP2Context >> nextFor: aCharacter [
	^ (stream atEnd: position) not ifTrue: [ 
		position := position + 1.
		^ ((stream atPosition: position) == aCharacter )
			ifTrue: [ true ]
			ifFalse:[ position := position - 1 . false ].
	] ifFalse: [  
		false
	]
]

{ #category : #accessing }
PP2Context >> parser [
	^ parser
]

{ #category : #accessing }
PP2Context >> parser: aPP2Parser [
	parser := aPP2Parser 
]

{ #category : #'stream mimicry' }
PP2Context >> peek [
	^ (stream atEnd: position) not ifTrue: [ 
		stream atPosition: position + 1
	]
]

{ #category : #'stream mimicry' }
PP2Context >> peekBack [
"
	Funny, stream throws an exception, so I should too :)	
		
	^ (position > 0) ifTrue: [ 
		stream atPosition: position
	]
"
	
	^ stream atPosition: position

]

{ #category : #'stream mimicry' }
PP2Context >> peekFor: anObject [ 
	"Answer false and do not move over the next element if it is not equal to 
	the argument, anObject, or if the receiver is at the end. Answer true 
	and increment the position for accessing elements, if the next element is 
	equal to anObject."
	| nextObject |
	self atEnd ifTrue: [^false].
	nextObject := self next.
	"peek for matching element"
	anObject = nextObject ifTrue: [^true].
	"gobble it if found"
	position := position - 1.
	^false
]

{ #category : #accessing }
PP2Context >> position [
	^ position
]

{ #category : #accessing }
PP2Context >> position: anInteger [
	position := anInteger
]

{ #category : #copying }
PP2Context >> postCopy [
	super postCopy.

	globals := globals copy.
	
]

{ #category : #printing }
PP2Context >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $:.
	aStream nextPut: $ .
	stream printOn: aStream
]

{ #category : #'accessing - properties' }
PP2Context >> properties [
	^ properties
]

{ #category : #'accessing - properties' }
PP2Context >> properties: newProperties [
	^ properties := newProperties
]

{ #category : #memoization }
PP2Context >> remember [
	^ PP2ContextMemento new
		stream: stream;
		position: position;
		properties: self propertiesCopy;
		yourself.

]

{ #category : #memoization }
PP2Context >> rememberPosition [
	^ position
]

{ #category : #initialization }
PP2Context >> reset [
	globals := nil
]

{ #category : #memoization }
PP2Context >> restore: contextMemento [
	position := contextMemento position.
	properties := contextMemento propertiesCopy.
]

{ #category : #memoization }
PP2Context >> restorePosition: anInteger [
	position := anInteger
]

{ #category : #accessing }
PP2Context >> returnValue [
	^ returnValue
]

{ #category : #accessing }
PP2Context >> returnValue: anObject [
	returnValue := anObject
]

{ #category : #'stream extras' }
PP2Context >> shift [
	position := position + 1
]

{ #category : #requirements }
PP2Context >> startMemento [
	^ startMemento
]

{ #category : #requirements }
PP2Context >> startMemento: anObject [
	startMemento := anObject
]

{ #category : #accessing }
PP2Context >> stream [
	^ stream
]

{ #category : #accessing }
PP2Context >> stream: aStream [
	stream := aStream
]

{ #category : #'stream extras' }
PP2Context >> uncheckedNext [
	position := position + 1.
	^ stream atPosition: position
]

{ #category : #'stream extras' }
PP2Context >> uncheckedPeek [
	^ stream atPosition: position + 1
]

{ #category : #'stream mimicry' }
PP2Context >> upTo: character [
	| start |
	start := position := position + 1.
	
	[ 
		(stream atEnd: position) ifTrue: [  
			^ stream copyFrom: start to: position	
		].
		(stream atPosition: position) = character
		
	] whileFalse: [ position := position + 1 ].

	^ stream copyFrom: start to: position 


]

{ #category : #'stream mimicry' }
PP2Context >> upToEnd [
	| start |
	start := position.
	
	[ stream atEnd: position ] whileFalse: [ position := position + 1 ].
	^ stream copyFrom: start + 1 to: position
]

{ #category : #evaluating }
PP2Context >> value [
	^ returnValue
]
