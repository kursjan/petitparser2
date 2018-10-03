Class {
	#name : #PP2RecordingCache,
	#superclass : #PP2Cache,
	#traits : 'TPP2RecordingCache',
	#classTraits : 'TPP2RecordingCache classTrait',
	#instVars : [
		'invocations',
		'hits'
	],
	#category : 'PetitParser2-Recording'
}

{ #category : #accessing }
PP2RecordingCache >> hits [
	^ hits
]

{ #category : #accessing }
PP2RecordingCache >> hits: anInteger [
	hits := anInteger
]

{ #category : #initialization }
PP2RecordingCache >> initialize [
	super initialize.
	self resetCounters.
]

{ #category : #accessing }
PP2RecordingCache >> invocations [
	^ invocations 
]

{ #category : #accessing }
PP2RecordingCache >> invocations: anInteger [
	invocations := anInteger
]
