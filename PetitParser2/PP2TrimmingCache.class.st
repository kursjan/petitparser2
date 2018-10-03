Class {
	#name : #PP2TrimmingCache,
	#superclass : #PP2WrappingStrategy,
	#instVars : [
		'failure',
		'lastTrimming'
	],
	#category : 'PetitParser2-Strategies'
}

{ #category : #conversion }
PP2TrimmingCache >> cache [
	"I already cache trimming, no need to add another layer of caches"
	^ self
]

{ #category : #profiling }
PP2TrimmingCache >> cacheHit: context [
]

{ #category : #initialization }
PP2TrimmingCache >> initializeFor: aPP2Strategy [
	super initializeFor: aPP2Strategy.
	
	failure := PP2Failure message: 'no more whitespace'
]

{ #category : #profiling }
PP2TrimmingCache >> invocation [
]

{ #category : #testing }
PP2TrimmingCache >> isCache [
	^ true
]

{ #category : #parsing }
PP2TrimmingCache >> parseOn: context [
	| retval |
	self invocation.
	(context position == lastTrimming) ifTrue: [ 
		self cacheHit: context.
		^ failure 
	].
	retval := strategy parseOn: context.
	lastTrimming := context position.
	^ retval
]

{ #category : #conversion }
PP2TrimmingCache >> recording [
	^ PP2RecordingTrimmingCache on: strategy
]

{ #category : #initialization }
PP2TrimmingCache >> reset [
	lastTrimming := nil
]

{ #category : #conversion }
PP2TrimmingCache >> trimmingCache [
	^ self
]
