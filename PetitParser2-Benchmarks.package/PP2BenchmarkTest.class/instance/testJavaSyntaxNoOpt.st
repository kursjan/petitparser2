testing - smalltalk
testJavaSyntaxNoOpt
	| input  bench |
	bench := PP2Benchmark new.
	bench setupJavaSyntaxNoOpt.

	self assert: (bench parser isKindOf: PPJavaSyntax).
	self assert: (bench parser isOptimized not).
	
	input := bench input.
	context := bench context.
	selector := bench selector.

	self assert: (bench parser end perform: selector withArguments: {input first . context }) isPetit2Failure not.