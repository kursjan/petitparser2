Class {
	#name : #PP2RecordingMemoizedSea,
	#superclass : #PP2MemoizedSea,
	#traits : 'TPP2RecordingCache',
	#classTraits : 'TPP2RecordingCache classTrait',
	#instVars : [
		'invocations',
		'hits'
	],
	#category : 'PetitParser2-Recording'
}

{ #category : #profiling }
PP2RecordingMemoizedSea >> hits [
	^ hits
]

{ #category : #profiling }
PP2RecordingMemoizedSea >> hits: anInteger [
	hits := anInteger
]

{ #category : #initialization }
PP2RecordingMemoizedSea >> initialize [
	super initialize.
	self resetCounters.
]

{ #category : #profiling }
PP2RecordingMemoizedSea >> invocations [
	^ invocations
]

{ #category : #profiling }
PP2RecordingMemoizedSea >> invocations: anInteger [
	invocations := anInteger
]
