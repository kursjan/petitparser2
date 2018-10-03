Trait {
	#name : #TPP2RecordingCache,
	#category : 'PetitParser2-Recording'
}

{ #category : #recording }
TPP2RecordingCache >> cacheHit: context [
	self hits: self hits + 1.
	context cacheHit.
]

{ #category : #'accessing - statistics' }
TPP2RecordingCache >> hitRatio [
	^ self hits / (self invocations max: 1) asFloat
]

{ #category : #recording }
TPP2RecordingCache >> hits [
	self explicitRequirement
]

{ #category : #recording }
TPP2RecordingCache >> hits: anInteger [
	self explicitRequirement
]

{ #category : #initialization }
TPP2RecordingCache >> initialize [
	super initialize.
	self resetCounters.
]

{ #category : #recording }
TPP2RecordingCache >> invocation [
	self invocations: self invocations + 1
]

{ #category : #recording }
TPP2RecordingCache >> invocations [
	self explicitRequirement
]

{ #category : #recording }
TPP2RecordingCache >> invocations: anInteger [
	self explicitRequirement
]

{ #category : #testing }
TPP2RecordingCache >> isRecording [
	^ true
]

{ #category : #conversion }
TPP2RecordingCache >> recording [
	^ self
]

{ #category : #recording }
TPP2RecordingCache >> resetCounters [
	self invocations: 0.
	self hits: 0.
]
