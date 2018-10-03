Class {
	#name : #PP2Benchmark,
	#superclass : #Object,
	#instVars : [
		'preferredRepetitions',
		'report',
		'input',
		'parser',
		'repetitions',
		'resources',
		'sourcesSize',
		'properties',
		'contextClass',
		'selector'
	],
	#category : 'PetitParser2-Benchmarks-Core'
}

{ #category : #examples }
PP2Benchmark class >> exampleExpressionGrammar [
	<example>
	
	| b |
	b := PP2Benchmark new.
	b benchmarkExpressionGrammar.
	b benchmarkExpressionGrammarNoOpt.
	b showTpcs inspect
]

{ #category : #'benchmarks - expression grammar' }
PP2Benchmark >> benchmarkExpressionGrammar [
	self smartSetupAndRun: thisContext method selector.
]

{ #category : #'benchmarks - expression grammar' }
PP2Benchmark >> benchmarkExpressionGrammarNoOpt [
	self smartSetupAndRun: thisContext method selector.
]

{ #category : #'benchmarks - expression grammar' }
PP2Benchmark >> benchmarkExpressionParser [
	self smartSetupAndRun: thisContext method selector.
]

{ #category : #accessing }
PP2Benchmark >> context [
	^ contextClass new
]

{ #category : #accessing }
PP2Benchmark >> contextClass: aClass [
	^ contextClass := aClass
]

{ #category : #accessing }
PP2Benchmark >> createResources [
	^ PP2Sources current
]

{ #category : #'accessing - properties' }
PP2Benchmark >> hasProperty: aKey [
	"Test if the property aKey is present."
	
	^ properties notNil and: [ properties includesKey: aKey ]
]

{ #category : #initialization }
PP2Benchmark >> initialize [
	super initialize.
	resources := self createResources.
	
	contextClass := PP2Context.
	preferredRepetitions := 1.
	report := PP2BenchmarkReport new.
	sourcesSize := 'Benchmarking'.
	
	selector := #'parse:withContext:'
]

{ #category : #accessing }
PP2Benchmark >> input [
	^ input
]

{ #category : #accessing }
PP2Benchmark >> input: anObject [
	input := anObject
]

{ #category : #accessing }
PP2Benchmark >> instantiate: aParserClass [
	^ aParserClass new
]

{ #category : #accessing }
PP2Benchmark >> parser [
	^ parser
]

{ #category : #accessing }
PP2Benchmark >> parser: anObject [
	parser := anObject
]

{ #category : #'accessing - properties' }
PP2Benchmark >> properties [
	^ properties
]

{ #category : #'accessing - properties' }
PP2Benchmark >> properties: aDictionary [
	properties := aDictionary 
]

{ #category : #'accessing - properties' }
PP2Benchmark >> propertyAt: aKey [ 
	^ self propertyAt: aKey  ifAbsent: [ nil ]
]

{ #category : #'accessing - properties' }
PP2Benchmark >> propertyAt: aKey ifAbsent: aBlock [
	"Answer the property value associated with aKey or, if aKey isn't found, answer the result of evaluating aBlock."
	
	^ properties isNil
		ifTrue: [ aBlock value ]
		ifFalse: [ properties at: aKey ifAbsent: aBlock ]
]

{ #category : #'accessing - properties' }
PP2Benchmark >> propertyAt: aKey ifAbsentPut: aBlock [
	"Answer the property associated with aKey or, if aKey isn't found store the result of evaluating aBlock as new value."
	
	^ self propertyAt: aKey ifAbsent: [ self propertyAt: aKey put: aBlock value ]
]

{ #category : #'accessing - properties' }
PP2Benchmark >> propertyAt: aKey put: anObject [
	"Set the property at aKey to be anObject. If aKey is not found, create a new entry for aKey and set is value to anObject. Answer anObject."

	^ (properties ifNil: [ properties := Dictionary new: 1 ])
		at: aKey put: anObject
]

{ #category : #accessing }
PP2Benchmark >> repetitions [
	^ repetitions isNil ifTrue: [ preferredRepetitions  ] ifFalse: [ repetitions ]
]

{ #category : #accessing }
PP2Benchmark >> repetitions: anObject [
	repetitions := anObject
]

{ #category : #accessing }
PP2Benchmark >> repetitionsIfNotSet: value [
	repetitions := value
]

{ #category : #accessing }
PP2Benchmark >> report [
	^ report
]

{ #category : #reporting }
PP2Benchmark >> reportInput: anInput time: time gcTime: gcTime name: nameOrNil [
	| size name |
	size := anInput inject: 0 into: [:r :e | r + e size  ].
	
	name := nameOrNil isNil 
		ifTrue: [ parser class printString ]
		ifFalse: [ nameOrNil ].
	
	report addEntry: name size: size time: time gcTime: gcTime.
]

{ #category : #reporting }
PP2Benchmark >> reportInput: anInput time: time name: nameOrNil [
	self reportInput: anInput time: time gcTime:  0 name: nameOrNil
]

{ #category : #accessing }
PP2Benchmark >> resources [
	^ resources
]

{ #category : #accessing }
PP2Benchmark >> resources: newResources [
	resources := newResources
]

{ #category : #running }
PP2Benchmark >> run [
	| time gcTime |
	self repetitions timesRepeat: [ 
		3 timesRepeat: [ Smalltalk garbageCollect ].
		gcTime := Smalltalk vm totalGCTime.
		time := [ input do: [ :source | 
			"parser parse: source withContext: self context"
			parser perform: selector withArguments: {  source . self context }.
		] ] timeToRun asMilliseconds.
		
		self reportInput: input time: time gcTime: (Smalltalk vm totalGCTime - gcTime) name: parser name
	]
]

{ #category : #running }
PP2Benchmark >> runTimeout: timeout [
	| time gcTime |
	self repetitions timesRepeat: [ 
		3 timesRepeat: [ Smalltalk garbageCollect ].
		gcTime := Smalltalk vm totalGCTime.
		time := [ input do: [ :source | 
			[ parser parse: source withContext: self context ]
				valueWithin: timeout
				onTimeout: [ Transcript show: 'timeout'; cr. #timeout ]
		] ] timeToRun asMilliSeconds.

		self reportInput: input time: time gcTime: (Smalltalk vm totalGCTime - gcTime) name: parser class asString
	]
]

{ #category : #reporting }
PP2Benchmark >> saveReport: filename [
	report save: filename
	
]

{ #category : #accessing }
PP2Benchmark >> selector [
	^ selector 
]

{ #category : #'setup & teardown' }
PP2Benchmark >> setup: class sources: name [
	parser := self instantiate: class.
	input := self sourcesFor: name
	
]

{ #category : #'benchmarks - expression grammar' }
PP2Benchmark >> setupExpressionGrammar [
	self setup: PP2ExpressionGrammar sources: 'expression'.
	parser name: 'Arithmetic Expressions'.
	self parser optimize.
	
	contextClass := PP2InMemoryContext.
	selector := #'parseAdaptable:withContext:'.
	preferredRepetitions := 3
]

{ #category : #'benchmarks - expression grammar' }
PP2Benchmark >> setupExpressionGrammarNoOpt [
	self setup: PP2ExpressionGrammar sources: 'expression'.
	parser name: 'Arithmetic Expressions (NoOpt)'.
	preferredRepetitions := 3.
	
	contextClass := PP2Context.
	selector := #'parseAdaptable:withContext:'.
	preferredRepetitions := 3.

]

{ #category : #'benchmarks - expression grammar' }
PP2Benchmark >> setupExpressionParser [
	self setup: PP2ExpressionParser sources: 'expression'.
	parser name: 'Arithmetic Expressions Parser'.
	preferredRepetitions := 3.
	
	contextClass := PP2Context.
]

{ #category : #'setup & teardown' }
PP2Benchmark >> setupMock: id [
	input := OrderedCollection with: 'mock'.
	parser := (nil asPParser)
		name: id;
		yourself
]

{ #category : #running }
PP2Benchmark >> setupSelector: setupSelector [
	self perform: ('setup', setupSelector) asSymbol.
]

{ #category : #reporting }
PP2Benchmark >> showDetailedReport [
	report showDetailed
]

{ #category : #reporting }
PP2Benchmark >> showReport [
	report show
]

{ #category : #reporting }
PP2Benchmark >> showSpeedup [
	report speedup
]

{ #category : #'setup & teardown' }
PP2Benchmark >> smartSetupAndRun: benchmarkSelector [
	^ self testSetupAndRun: (benchmarkSelector removePrefix: 'benchmark')
]

{ #category : #accessing }
PP2Benchmark >> sourcesFor: language [
	| sourcesSelector |
	sourcesSelector := (language asString, 'Sources', sourcesSize) asSymbol.	
	^ resources perform: sourcesSelector
]

{ #category : #accessing }
PP2Benchmark >> sourcesSize: aString [
	sourcesSize := aString
]

{ #category : #'setup & teardown' }
PP2Benchmark >> teardownSelector: teardownSelector [
	| symbol |
	symbol := ('teardown', teardownSelector) asSymbol.
	
	(self respondsTo: symbol) ifTrue: [ 
		self perform: symbol.
	]
]

{ #category : #accessing }
PP2Benchmark >> testClass [
	^ PP2BenchmarkTest
]

{ #category : #running }
PP2Benchmark >> testSelector: testSelector [
	self testClass new perform: ('test', testSelector) asSymbol.
]

{ #category : #running }
PP2Benchmark >> testSetupAndRun: runSelector [
	self testSelector: runSelector.
	self setupSelector: runSelector.
	self run.
	self teardownSelector: runSelector.
]
