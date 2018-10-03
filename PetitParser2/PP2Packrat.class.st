Class {
	#name : #PP2Packrat,
	#superclass : #PP2WrappingStrategy,
	#instVars : [
		'buffer',
		'memoizationStrategy'
	],
	#category : 'PetitParser2-Strategies'
}

{ #category : #accessing }
PP2Packrat >> buffer [
	^ buffer
]

{ #category : #profiling }
PP2Packrat >> cacheHit: context [
]

{ #category : #profiling }
PP2Packrat >> invocation [
]

{ #category : #testing }
PP2Packrat >> isCache [
	^ true
]

{ #category : #testing }
PP2Packrat >> isMemoized [
	^ true
]

{ #category : #conversion }
PP2Packrat >> memoize [
	^ self
]

{ #category : #parsing }
PP2Packrat >> parseOn: context [
	| contextMemento returnValue result |
	self invocation.
	contextMemento := self remember: context.
	buffer at: contextMemento ifPresent: [:memento |
		self cacheHit: context.
		self restore: context from: memento contextMemento.
		^ memento returnValue
	].

	returnValue := strategy parseOn: context.

	result := PP2Memento new 
		returnValue: returnValue;
		contextMemento: (self remember: context);
		yourself.

	buffer at: contextMemento put: result.

	^ returnValue

]

{ #category : #conversion }
PP2Packrat >> recording [
	^ PP2RecordingPackrat on: strategy
]

{ #category : #memoization }
PP2Packrat >> remember: context [
	^ memoizationStrategy remember: context
]

{ #category : #accessing }
PP2Packrat >> reset [
	self node isContextSensitive ifTrue: [  
		memoizationStrategy := PP2CSMemoization new.
		buffer := Dictionary new
	] ifFalse: [  
		memoizationStrategy := PP2CFMemoization new.
		buffer := IdentityDictionary new
	]
]

{ #category : #memoization }
PP2Packrat >> restore: context from: memento [
	^ memoizationStrategy restore: context from: memento
]
