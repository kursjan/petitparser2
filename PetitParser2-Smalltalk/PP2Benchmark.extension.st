Extension { #name : #PP2Benchmark }

{ #category : #'*PetitParser2-Smalltalk' }
PP2Benchmark >> benchmarkRBParser [
	| time  |
	self setupRBParser.
	
	self repetitions timesRepeat: [ 
		time := [ input do: [ :source | 
			
			parser initializeParserWith: source.
			parser parseMethod: source
			
		] ] timeToRunWithoutGC "timeToRun asMilliseconds.".
		
		self reportInput: input time: time name: parser name
	]
]

{ #category : #'*PetitParser2-Smalltalk' }
PP2Benchmark >> benchmarkSmalltalkGrammar [
		self smartSetupAndRun: thisContext method selector.
]

{ #category : #'*PetitParser2-Smalltalk' }
PP2Benchmark >> benchmarkSmalltalkGrammarNoOpt [
		self smartSetupAndRun: thisContext method selector.
]

{ #category : #'*PetitParser2-Smalltalk' }
PP2Benchmark >> benchmarkSmalltalkParser [
		self smartSetupAndRun: thisContext method selector.
]

{ #category : #'*PetitParser2-Smalltalk' }
PP2Benchmark >> benchmarkSmalltalkParserNoOpt [
		self smartSetupAndRun: thisContext method selector.
]

{ #category : #'*PetitParser2-Smalltalk' }
PP2Benchmark >> benchmarkSmalltalkParserSmacc [
	| time  gcTime |
	self setupSmalltalkParserSmacc.
	
	self repetitions timesRepeat: [ 
		3 timesRepeat: [ Smalltalk garbageCollect ].
	
		gcTime := Smalltalk vm totalGCTime.
		time := [ input do: [ :source | 
			parser parse: source
		] ] timeToRun asMilliSeconds.
		
		self reportInput: input time: time gcTime: (Smalltalk vm totalGCTime - gcTime) name: parser name
	]
]

{ #category : #'*PetitParser2-Smalltalk' }
PP2Benchmark class >> exampleSmalltalk [
	<example>
	
	| b |
	Metacello new
  		baseline: 'SmaCC';
		repository: 'github://ThierryGoubier/SmaCC:v2.0.5';
 		load: 'SmaCC-Smalltalk-Parser'.

	b := PP2Benchmark new.
	b benchmarkSmalltalkParser.
	b benchmarkSmalltalkParserNoOpt.
	b benchmarkSmalltalkParserSmacc.
	b benchmarkRBParser.
	b showTpcs inspect
]

{ #category : #'*PetitParser2-Smalltalk' }
PP2Benchmark >> setupRBParser [
	
	input := self sourcesFor: 'smalltalk'.
	parser := RBParser new.
	preferredRepetitions := 3.
]

{ #category : #'*PetitParser2-Smalltalk' }
PP2Benchmark >> setupSmalltalkGrammar [
	self setup: PP2SmalltalkGrammar sources: 'smalltalk'.
	self parser name: 'PP2 Smalltalk Grammar'.
	self parser optimize.
	
	contextClass := PP2InMemoryContext.
	selector := #'parseAdaptable:withContext:'.
	preferredRepetitions := 3.
	
]

{ #category : #'*PetitParser2-Smalltalk' }
PP2Benchmark >> setupSmalltalkGrammarNoOpt [
	self setup: PP2SmalltalkGrammar sources: 'smalltalk'.
	self parser name: 'PP2 Smalltalk Grammar (NoOpt)'.
	
	contextClass := PP2Context.
	selector := #'parseAdaptable:withContext:'.
	preferredRepetitions := 3.
	
]

{ #category : #'*PetitParser2-Smalltalk' }
PP2Benchmark >> setupSmalltalkParser [
	self setup: PP2SmalltalkParser sources: 'smalltalk'.
	self parser name: 'PP2 Smalltalk Parser'.
	self parser optimize.
	
	contextClass := PP2InMemoryContext.
	selector := #'parseAdaptable:withContext:'.
	preferredRepetitions := 3.
	
]

{ #category : #'*PetitParser2-Smalltalk' }
PP2Benchmark >> setupSmalltalkParserNoOpt [
	self setup: PP2SmalltalkParser sources: 'smalltalk'.
	self parser name: 'PP2 Smalltalk Parser (No Opt)'.
	
	contextClass := PP2Context.
	selector := #'parseAdaptable:withContext:'.
	preferredRepetitions := 3.
	
]

{ #category : #'*PetitParser2-Smalltalk' }
PP2Benchmark >> setupSmalltalkParserSmacc [
	"
		Metacello new
		  	baseline: 'SmaCC';
  			repository: 'github://ThierryGoubier/SmaCC:v2.0.5';
  			load: 'SmaCC-Smalltalk-Parser'
	"
	
	
	input := self sourcesFor: 'smalltalk'.
	parser := Smalltalk at: #StParser.
	preferredRepetitions := 3.
]
