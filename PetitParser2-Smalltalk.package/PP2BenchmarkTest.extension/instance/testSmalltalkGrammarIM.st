*PetitParser2-Smalltalk
testSmalltalkGrammarIM
	| input  bench |
	bench := PP2Benchmark new.
	bench setupSmalltalkGrammarIM.

	self assert: (bench parser isKindOf: PP2SmalltalkGrammar).
	input := bench input.
	context := bench context.
	selector := bench selector.

	self assert: (bench parser end perform: selector withArguments: {input first . context }) isPetit2Failure not.