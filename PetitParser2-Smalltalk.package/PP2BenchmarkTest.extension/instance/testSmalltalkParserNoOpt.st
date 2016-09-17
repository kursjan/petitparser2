*PetitParser2-Smalltalk
testSmalltalkParserNoOpt
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
	