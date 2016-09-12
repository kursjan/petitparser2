testing - smalltalk
testJavaSyntax
	| input  bench |
	bench := PP2Benchmark new.
	bench setupJavaSyntax.

	self assert: (bench parser isKindOf: PPJavaSyntax).
	self assert: (bench parser isOptimized).
	
	input := bench input.
	context := bench context.
	selector := bench selector.

	self assert: (bench parser end perform: selector withArguments: {input first . context }) isPetit2Failure not.