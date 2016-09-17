*PetitParser2-Smalltalk
testSmalltalkParser
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
	