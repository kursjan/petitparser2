streams
testPP2ExpressionGrammarOptimizations
	| validator |
	validator := PP2ExpressionGrammarOptimizaitonsValidator new.
	validator validateBlocking.
	
	self assert: validator report precision equals: 1.
	self assert: validator report recall equals: 1.