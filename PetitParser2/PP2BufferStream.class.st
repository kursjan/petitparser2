"
Suppose very minimal stream with the following interface:
- atEnd
- next

I can adapt this stream and provide the PP2SStream interface thanks to the buffer.

Note: I index everything from 0 and not from 1. The reason being the modulo arithmetics that works better when indexed from 0.
"
Class {
	#name : #PP2BufferStream,
	#superclass : #Object,
	#instVars : [
		'stream',
		'buffer',
		'bufferSize',
		'position'
	],
	#category : 'PetitParser2-Streams'
}

{ #category : #'as yet unclassified' }
PP2BufferStream class >> new [
	"for compatibility reasons"
	^ self basicNew
		initialize
]

{ #category : #'as yet unclassified' }
PP2BufferStream class >> on: stream [
	^ self on: stream bufferSize: 1024
]

{ #category : #'as yet unclassified' }
PP2BufferStream class >> on: stream bufferSize: bufferSize [
	^ (self basicNew)
		initializeForSize: bufferSize;
		stream: stream;
		yourself
]

{ #category : #converting }
PP2BufferStream >> asPetit2Context [
	^ PP2Context on: self
]

{ #category : #converting }
PP2BufferStream >> asPetit2Stream [
	^ self
]

{ #category : #converting }
PP2BufferStream >> asPetitStream [
	^ stream asPetitStream
]

{ #category : #'context interface' }
PP2BufferStream >> atEnd: readPosition [
	self upToPosition: readPosition.
	
	^ (readPosition >= position) and: [ stream atEnd ]
]

{ #category : #'context interface' }
PP2BufferStream >> atPosition: readPosition [
	(readPosition == position) ifTrue: [ 
		^ self last.
	].

	(readPosition > position) ifTrue: [ 
		self upToPosition: readPosition.
		(readPosition > position) ifTrue: [ SubscriptOutOfBounds signal ].
		^ self last
	].

	"backtrack case"
	(position - readPosition >= bufferSize) ifTrue: [ 
		SubscriptOutOfBounds signalFor: readPosition.
	].
	^ buffer at: ((readPosition - 1) % bufferSize) + 1.


]

{ #category : #'accessing - private' }
PP2BufferStream >> buffer [
	^ buffer 
]

{ #category : #'accessing - private' }
PP2BufferStream >> bufferSize [
	^ bufferSize
]

{ #category : #accessing }
PP2BufferStream >> contents [
	"Not sure, what is the best think to return..."
	^ buffer contents copyFrom: 1 to: position
]

{ #category : #'context interface' }
PP2BufferStream >> copyFrom: start to: stop [
	"start - end should be in range <0, size)"
	| bufferStart bufferStop |	
	(stop - start >= bufferSize ) ifTrue: [ 
		"range bigger than buffer"
		SubscriptOutOfBounds signalFor: start.
	].

	(position - start >= bufferSize) ifTrue: [ 
		"buffer not big enough"
		SubscriptOutOfBounds signalFor: start.
	].

	self upToPosition: stop.
	
	(position < stop) ifTrue: [ 
		SubscriptOutOfBounds signalFor: stop.
	].


	bufferStart := ((start - 1) % bufferSize) + 1.
	bufferStop := ((stop -1) % bufferSize) + 1.
	
	(bufferStart <= bufferStop) ifTrue: [ 
		^ buffer copyFrom: bufferStart to: bufferStop
	] ifFalse: [
		| retval |
		retval := ByteString new: stop - start + 1. 
		0 to: stop - start do: [ :index |
			retval at: (index + 1) put: (buffer at: ((start - 1 + index) % bufferSize) + 1)
		].
		^ retval
	]
]

{ #category : #initialization }
PP2BufferStream >> initialize [
	self initializeForSize: 1024
]

{ #category : #initialization }
PP2BufferStream >> initializeForSize: size [
	"nothing to do"
	bufferSize := size.
	buffer := ByteString new: bufferSize.
	position := 0.
]

{ #category : #testing }
PP2BufferStream >> isBuffered [
	^ true
]

{ #category : #private }
PP2BufferStream >> last [
	^ buffer at: ((position - 1) % bufferSize) + 1
]

{ #category : #'context interface' }
PP2BufferStream >> newToken: tokenClass from: start to: stop [
	| collection |
	collection := self copyFrom: start to: stop.
	
	^ tokenClass 
		on: collection 
		start:  1
		stop: 	(stop - start + 1)
]

{ #category : #testing }
PP2BufferStream >> printOn: writeStream position: currentPosition [
	"TODO: show the position as well"
	stream contents printOn: writeStream
]

{ #category : #initialization }
PP2BufferStream >> reset [
	
]

{ #category : #accessing }
PP2BufferStream >> stream: aStream [
	stream := aStream
]

{ #category : #private }
PP2BufferStream >> uncheckedNext [
	| bufferIndex |
	bufferIndex := (position % bufferSize) + 1.
	position := position + 1.
	
	buffer at: bufferIndex put: stream next.
	^ buffer at: bufferIndex
]

{ #category : #private }
PP2BufferStream >> upToPosition: readPosition [
	[position < (readPosition) and: [ stream atEnd not ]] whileTrue: [  
		self uncheckedNext
	]
]
