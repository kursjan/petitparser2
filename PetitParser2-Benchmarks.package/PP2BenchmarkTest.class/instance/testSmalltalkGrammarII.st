testing - smalltalk
testSmalltalkGrammarII
	| input  bench |
	bench := PP2Benchmark new.
	bench setupSmalltalkGrammarII.

	self assert: (bench parser isKindOf: PP2SmalltalkGrammar).
	self assert: (bench context isKindOf: PP2ImmutableContext).
	
	input := bench input.
	context := bench context.
	selector := bench selector.

	self assert: (bench parser end perform: selector withArguments: {input first . context }) isPetit2Failure not.