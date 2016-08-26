testing - smalltalk
testSmalltalkGrammarDirect
	| input  bench |
	bench := PP2Benchmark new.
	bench setupSmalltalkGrammarDirect.

	self assert: (bench parser isKindOf: PP2SmalltalkGrammar).
	input := bench input.

	self assert: (bench parser end parse: input first) isPetit2Failure not.