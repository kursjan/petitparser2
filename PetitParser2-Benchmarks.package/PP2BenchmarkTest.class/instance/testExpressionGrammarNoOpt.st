testing - expressions
testExpressionGrammarNoOpt
	| parser bench result input |
	bench := PP2Benchmark new setupExpressionGrammarNoOpt.
	parser := bench parser.
	
	self assert: parser class equals: PP2ExpressionGrammar.
	self assert: (bench context isKindOf: PP2Context).
	
	result := parser end parse: '1 + (2 * 3)'.
	self assert: result value size = 3.
	self assert: result value first equals: '1'.
	
	input := bench input.
	context := bench context.
	selector := bench selector.

	self assert: (bench parser end perform: selector withArguments: {input first . context }) isPetit2Failure not.