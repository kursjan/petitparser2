Class {
	#name : #PP2MemoizedSea,
	#superclass : #PP2WrappingStrategy,
	#instVars : [
		'buffer',
		'memoizationStrategy'
	],
	#category : 'PetitParser2-Strategies'
}

{ #category : #conversion }
PP2MemoizedSea >> cache [
	^ self
]

{ #category : #profiling }
PP2MemoizedSea >> cacheHit: context [
]

{ #category : #initialization }
PP2MemoizedSea >> initialize [
	super initialize.
	"
	Would be nice to call this, but there is some mess in initializations.
	This would be called before underlying strategy knows, what is its node :(
	
	self reset
	"
]

{ #category : #profiling }
PP2MemoizedSea >> invocation [
]

{ #category : #testing }
PP2MemoizedSea >> isCache [
	^ true
]

{ #category : #testing }
PP2MemoizedSea >> isMemoized [
	^ true
]

{ #category : #conversion }
PP2MemoizedSea >> memoize [
	^ self
]

{ #category : #parsing }
PP2MemoizedSea >> parseOn: context [
	| contextMemento returnValue |
	self invocation.
	contextMemento := self remember: context.
	buffer at: contextMemento ifPresent: [:memento |
		self cacheHit: context.
		self restore: context from: memento contextMemento.
		^ memento returnValue
	].

	returnValue := strategy parseOn: context.

	(context waterPosition == context position) ifFalse: [  
		| result |
		result := PP2Memento new 
			returnValue: returnValue;
			contextMemento: (self remember: context);
			yourself.

		buffer at: contextMemento put: result
	].

	^ returnValue

]

{ #category : #conversion }
PP2MemoizedSea >> recording [
	^ PP2RecordingMemoizedSea on: strategy
]

{ #category : #memoization }
PP2MemoizedSea >> remember: context [
	^ memoizationStrategy remember: context
]

{ #category : #initialization }
PP2MemoizedSea >> reset [
	self node isContextSensitive ifTrue: [  
		memoizationStrategy := PP2CSMemoization new.
		buffer := Dictionary new.
	] ifFalse: [  
		memoizationStrategy := PP2CFMemoization new.
		buffer := IdentityDictionary new
	]
]

{ #category : #memoization }
PP2MemoizedSea >> restore: context from: memento [
	^ memoizationStrategy restore: context from: memento
]
