testing - smalltalk
testSmalltalkParser
	| input  bench result |
	bench := PP2Benchmark new.
	bench setupSmalltalkParser.

	self assert: (bench parser isKindOf: PP2SmalltalkParser).
	input := bench input.
	context := bench context.
	selector := bench selector.

	self assert: (result := bench parser end perform: selector withArguments: {input first . context }) isPetit2Failure not.
	self assert: result isPetit2Failure not.
	self assert: result value isMethod.
	