Class {
	#name : #PP2RecordingTrimmingCache,
	#superclass : #PP2TrimmingCache,
	#traits : 'TPP2RecordingCache',
	#classTraits : 'TPP2RecordingCache classTrait',
	#instVars : [
		'invocations',
		'hits'
	],
	#category : 'PetitParser2-Recording'
}

{ #category : #accessing }
PP2RecordingTrimmingCache >> hits [
	^ hits 
]

{ #category : #accessing }
PP2RecordingTrimmingCache >> hits: anInteger [
	hits := anInteger
]

{ #category : #accessing }
PP2RecordingTrimmingCache >> invocations [
	^ invocations 
]

{ #category : #accessing }
PP2RecordingTrimmingCache >> invocations: anInteger [
	invocations := anInteger
]
