benchmarks - expression grammar
setupExpressionGrammar
	self setup: PP2ExpressionGrammar sources: 'expression'.
	parser name: 'Arithmetic Expressions'.
	preferredRepetitions := 3.
	
	contextClass := PP2Context