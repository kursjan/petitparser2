"
Remembers result of the underlying strategy for for the given position.

In case the same strategy is invoked for the second time at the same position, the previous result is returned. This is very lightweight and fast cache.
"
Class {
	#name : #PP2Cache,
	#superclass : #PP2WrappingStrategy,
	#instVars : [
		'position',
		'retval',
		'endPosition'
	],
	#category : #'PetitParser2-Strategies'
}

{ #category : #conversion }
PP2Cache >> cache [
	^ self
]

{ #category : #profiling }
PP2Cache >> cacheHit: context [
	"profiling not implemented"
]

{ #category : #profiling }
PP2Cache >> invocation [
	"profiling not implemented"
]

{ #category : #testing }
PP2Cache >> isCache [
	^ true
]

{ #category : #parsing }
PP2Cache >> parseOn: context [
	| start |
	self invocation.
	(context position == position) ifTrue: [ 
		self cacheHit: context.
		context position: endPosition.
		^ retval
	].
	start := context position.
	retval := strategy parseOn: context.
	position := start.
	endPosition := context position.
	
	^ retval
]

{ #category : #conversion }
PP2Cache >> recording [
	^ PP2RecordingCache on: strategy
]

{ #category : #initialization }
PP2Cache >> reset [
	position := -1
]
