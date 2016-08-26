testing - smalltalk
testSmalltalkParser
	| input  bench result |
	bench := PP2Benchmark new.
	bench setupSmalltalkParser.

	self assert: (bench parser isKindOf: PP2SmalltalkParser).
	input := bench input.

	result := bench parser end parse: input first.
	self assert: result isPetit2Failure not.
	self assert: result value isMethod.
	