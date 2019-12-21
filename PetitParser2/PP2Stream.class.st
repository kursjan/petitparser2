Class {
	#name : #PP2Stream,
	#superclass : #Object,
	#instVars : [
		'collection'
	],
	#category : #'PetitParser2-Streams'
}

{ #category : #'as yet unclassified' }
PP2Stream class >> new [
	"for compatibility reasons"
	^ self basicNew
		initialize
]

{ #category : #'as yet unclassified' }
PP2Stream class >> on: collection [
	^ self new
		collection: collection;
		yourself
]

{ #category : #reparsing }
PP2Stream >> adoptString: newString [
	collection := newString
]

{ #category : #converting }
PP2Stream >> asPetit2Context [
	^ PP2InMemoryContext on: self	collection
]

{ #category : #converting }
PP2Stream >> asPetit2Stream [
	^ self
]

{ #category : #'context interface' }
PP2Stream >> atEnd: position [
	^ collection size <= position
]

{ #category : #'context interface' }
PP2Stream >> atPosition: position [
	^ collection at: position
]

{ #category : #accessing }
PP2Stream >> collection [
	^ collection
]

{ #category : #accessing }
PP2Stream >> collection: aCollection [
	collection := aCollection
]

{ #category : #accessing }
PP2Stream >> contents [
	^ collection copyFrom: 1 to: collection size
]

{ #category : #'context interface' }
PP2Stream >> copyFrom: start to: end [
	"start - end should be in range <1, collection size> "
	^ collection copyFrom: start to: end
]

{ #category : #initialization }
PP2Stream >> initialize [
	super initialize
]

{ #category : #testing }
PP2Stream >> isBuffered [
	^ false
]

{ #category : #tokenization }
PP2Stream >> newToken: tokenClass from: start to: stop [
	^ tokenClass 
		on: collection 
		start:  start
		stop: 	stop
]

{ #category : #printing }
PP2Stream >> printOn: writeStream position: position [
	writeStream
		nextPutAll: (collection copyFrom: 1 to: position);
		nextPutAll: '·';
		nextPutAll: (collection copyFrom: position + 1 to: collection size)
]

{ #category : #initialization }
PP2Stream >> reset [
	
]
