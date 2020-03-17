Class {
	#name : #PP2RecordingPackrat,
	#superclass : #PP2Packrat,
	#traits : 'TPP2RecordingCache',
	#classTraits : 'TPP2RecordingCache classTrait',
	#instVars : [
		'invocations',
		'hits'
	],
	#category : 'PetitParser2-Recording'
}

{ #category : #accessing }
PP2RecordingPackrat >> hits [
	^ hits
]

{ #category : #accessing }
PP2RecordingPackrat >> hits: anObject [
	hits := anObject
]

{ #category : #initialization }
PP2RecordingPackrat >> initialize [
	super initialize.
	self resetCounters.
]

{ #category : #accessing }
PP2RecordingPackrat >> invocations [
	^ invocations
]

{ #category : #accessing }
PP2RecordingPackrat >> invocations: anObject [
	invocations := anObject
]
