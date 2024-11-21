Class {
	#name : 'PP2RecordingContextTest',
	#superclass : 'TestCase',
	#traits : 'TPP2ContextTest + TPP2DebuggableTest + TPP2CollectionAssertions',
	#classTraits : 'TPP2ContextTest classTrait + TPP2DebuggableTest classTrait + TPP2CollectionAssertions classTrait',
	#category : 'PetitParser2-Tests-Profiling',
	#package : 'PetitParser2-Tests',
	#tag : 'Profiling'
}

{ #category : 'requirements' }
PP2RecordingContextTest >> contextOn: aString [
	^ PP2RecordingContext on: aString
]

{ #category : 'tests - profiling' }
PP2RecordingContextTest >> testAsFrequencyTable [
	| parser context table |
	parser := PP2ExpressionParser new optimize enableDebug.
	context := self contextOn: '1+2'.
	
	parser parseWithContext: context.
	
	table := context asFrequencyTable.
	self assert: (table collect: #first) noneSatisfy: [ :e | e isNil ].
	self assert: (table collect: #second) allSatisfy: [ :e | e isNumber ].
	self assert: (table collect: #third) allSatisfy: [ :e | e isNumber ].
	
	"This comes from the parseAdaptableWithContext, when remember is called"
	self assert: (context eventsTrace strategies) anySatisfy: [ :e | e isKindOf: PP2NilStrategy  ]
]

{ #category : 'tests - debugging' }
PP2RecordingContextTest >> testDebugResultDebug [
	| context parser resultContext |
	context := PP2RecordingContext new.
	
	parser := 'foo' asPParser star.
	resultContext := parser debug: 'foofoofoo' withContext: context.
	
	self assert: resultContext returnValue isPetit2Success.
	self assert: context debugResult isNil not.
	self assert: context debugResult children size equals: 1.
]

{ #category : 'tests - debugging' }
PP2RecordingContextTest >> testDebugResultNoDebug [
	| context parser resultContext |
	context := PP2RecordingContext new.
	
	parser := 'foo' asPParser star.
	resultContext := parser parse: 'foofoofoo' withContext: context.
	
	self assert: resultContext returnValue isPetit2Success.
	self assert: context debugResult isNil not.
	self assert: context debugResult children size equals: 1.
]

{ #category : 'tests - profiling' }
PP2RecordingContextTest >> testMultipleProfilingStrategies [
	| cache parser context debugging |

	parser := #letter asPParser.
	cache := parser strategy cache.
	debugging := PP2DebuggingStrategy on: cache.
	parser strategy: debugging.
	
	context := self contextOn: ''.
	context parser: parser.
	
	self assert: parser strategies size equals: 3.
	self assert: (parser strategies first isKindOf: PP2RecordingDebuggingStrategy).
	self assert: (parser strategies second isKindOf: PP2RecordingCache).
	
]

{ #category : 'tests - profiling' }
PP2RecordingContextTest >> testParserRefreshCache [
	| parser context |

	parser := (#letter asPParser plus token trim, #word asPParser star token trim) flatten.
	parser optimize.
	self assert:( parser allCaches noneSatisfy: [:c | c isRecording ]).

	
	context := self contextOn: ''.
	context parser: parser.
	self assert: parser allCaches size equals: 2.
	self assert:( parser allCaches allSatisfy: [:c | c isRecording ]).
	
]

{ #category : 'tests - profiling' }
PP2RecordingContextTest >> testRecordingCache [
	| parser context |

	parser := #letter asPParser.
	parser strategy: parser strategy cache.
	
	context := self contextOn: ''.
	context parser: parser.
	self assert: parser strategies size equals: 2.
	self assert: (parser strategy isKindOf: PP2RecordingCache).
	
]

{ #category : 'tests - debugging' }
PP2RecordingContextTest >> testSwitchToDebugging [
	| parser context |

	parser := (#letter asPParser plus token trim, #word asPParser star token trim) flatten.
	parser optimize.
	self assert:( parser allCaches noneSatisfy: [:c | c isRecording ]).

	
	context := self contextOn: ''.
	context parser: parser.
	self assert: parser allCaches size equals: 2.
	self assert:( parser allCaches allSatisfy: [:c | c isRecording ]).
	
]
