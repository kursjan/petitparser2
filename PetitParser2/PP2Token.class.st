Class {
	#name : #PP2Token,
	#superclass : #Object,
	#traits : 'TPP2Properties',
	#classTraits : 'TPP2Properties classTrait',
	#instVars : [
		'collection',
		'start',
		'stop',
		'properties'
	],
	#category : #'PetitParser2-Core'
}

{ #category : #'instance creation' }
PP2Token class >> on: collection start: start stop: stop [
	^ self new
		collection: collection;
		start: start;
		stop: stop;
		yourself
]

{ #category : #accessing }
PP2Token >> collection [
	^ collection
]

{ #category : #accessing }
PP2Token >> collection: anObject [
	collection := anObject
]

{ #category : #testing }
PP2Token >> isToken [
	^ true
]

{ #category : #printing }
PP2Token >> printOn: aStream [
	self value printOn: aStream.
	aStream nextPut: $[.
	start printOn: aStream.
	aStream nextPut: $,.
	stop printOn: aStream.
	aStream nextPut: $].
]

{ #category : #'accessing - properties' }
PP2Token >> properties [
	^ properties
]

{ #category : #'accessing - properties' }
PP2Token >> properties: newProperties [
	^ properties := newProperties
]

{ #category : #accessing }
PP2Token >> size [
	"Answer the size of this token in the underlying collection."

	^ stop - start + 1
]

{ #category : #accessing }
PP2Token >> start [
	^ start
]

{ #category : #accessing }
PP2Token >> start: anObject [
	start := anObject
]

{ #category : #accessing }
PP2Token >> stop [
	^ stop
]

{ #category : #accessing }
PP2Token >> stop: anObject [
	stop := anObject
]

{ #category : #printing }
PP2Token >> toString [
	^ self value, '[', start, ',', stop ,']'
]

{ #category : #evaluating }
PP2Token >> value [
	^ collection copyFrom: start to: stop
]
