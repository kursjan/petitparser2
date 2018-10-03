Extension { #name : #PP2BenchmarkTest }

{ #category : #'*PetitParser2-Smalltalk' }
PP2BenchmarkTest >> testSmalltalkGrammar [
	| input  bench |
	bench := PP2Benchmark new.
	bench setupSmalltalkGrammar.

	self assert: (bench parser isKindOf: PP2SmalltalkGrammar).
	self assert: (bench parser isOptimized).
	
	input := bench input.
	context := bench context.
	selector := bench selector.

	self assert: (bench parser end perform: selector withArguments: {input first . context }) isPetit2Failure not.
]

{ #category : #'*PetitParser2-Smalltalk' }
PP2BenchmarkTest >> testSmalltalkGrammarNoOpt [
	| input  bench |
	bench := PP2Benchmark new.
	bench setupSmalltalkGrammarNoOpt.

	self assert: (bench parser isKindOf: PP2SmalltalkGrammar).
	self assert: (bench parser isOptimized not).
	
	input := bench input.
	context := bench context.
	selector := bench selector.

	self assert: (bench parser end perform: selector withArguments: {input first . context }) isPetit2Failure not.
]

{ #category : #'*PetitParser2-Smalltalk' }
PP2BenchmarkTest >> testSmalltalkParser [
	| input  bench result rbresult |
	bench := PP2Benchmark new.
	bench setupSmalltalkParser.

	self assert: (bench parser isKindOf: PP2SmalltalkParser).
	self assert: (bench parser isOptimized).
	
	input := bench input.
	context := bench context.
	selector := bench selector.

	self assert: (result := bench parser end perform: selector withArguments: {input first . context }) isPetit2Failure not.
	self assert: result isPetit2Failure not.
	self assert: result value isMethod.
	
	"Sanity check against RBParser"
	rbresult := RBParser parseMethod: input first.
	self assert: result value equals: rbresult
	
]

{ #category : #'*PetitParser2-Smalltalk' }
PP2BenchmarkTest >> testSmalltalkParserNoOpt [
	| input  bench result |
	bench := PP2Benchmark new.
	bench setupSmalltalkParserNoOpt.

	self assert: (bench parser isKindOf: PP2SmalltalkParser).
	self assert: (bench parser isOptimized not).
	
	input := bench input.
	context := bench context.
	selector := bench selector.

	self assert: (result := bench parser end perform: selector withArguments: {input first . context }) isPetit2Failure not.
	self assert: result isPetit2Failure not.
	self assert: result value isMethod.
	
]
