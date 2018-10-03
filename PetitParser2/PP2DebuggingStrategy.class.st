Class {
	#name : #PP2DebuggingStrategy,
	#superclass : #PP2WrappingStrategy,
	#instVars : [
		'resultCache'
	],
	#category : 'PetitParser2-Debug'
}

{ #category : #'instance creation' }
PP2DebuggingStrategy class >> on: aPP2Strategy [
	^ self new initializeFor: aPP2Strategy
]

{ #category : #conversion }
PP2DebuggingStrategy >> cache [
	strategy := strategy cache
]

{ #category : #caching }
PP2DebuggingStrategy >> cacheIfNeeded: result debugResult: debugResult [
	
	(strategy includesCache and: [ (resultCache includesKey: result) and: [ (debugResult allResults size = 1 )]]) ifTrue:[
		debugResult children add: (PP2DebugResultLink on: (resultCache at: result))
	] ifFalse: [ 
		resultCache at: result put: debugResult.
	]
]

{ #category : #conversion }
PP2DebuggingStrategy >> debug [
	^ self
]

{ #category : #initialization }
PP2DebuggingStrategy >> initialize [
	resultCache := IdentityDictionary new.
]

{ #category : #testing }
PP2DebuggingStrategy >> isDebugging [
	^ true
]

{ #category : #parsing }
PP2DebuggingStrategy >> parseOn: context [
	| parentDebugResult debugResult result |
	parentDebugResult := context currentDebugResult.
	
	debugResult := PP2DebugResult new
		parser: self node;
		start: context position + 1;
		parent: parentDebugResult;
		yourself.
	
	parentDebugResult children add: debugResult.
		
	context currentDebugResult: debugResult.
	result := strategy parseOn: context.
	self cacheIfNeeded: result debugResult: debugResult.
	context currentDebugResult: parentDebugResult.
	
	debugResult 
		stop: context position;
		result: result.
	
	^ result
]

{ #category : #conversion }
PP2DebuggingStrategy >> parsingGuard: classification [
	strategy := strategy parsingGuard: classification
]

{ #category : #conversion }
PP2DebuggingStrategy >> recording [
	^ PP2RecordingDebuggingStrategy on: strategy 
]

{ #category : #conversion }
PP2DebuggingStrategy >> reparsable [
	strategy := strategy reparsable
]

{ #category : #accessing }
PP2DebuggingStrategy >> withoutDebugStrategy [
	^ strategy withoutDebugStrategy
]
