benchmarks - expression grammar
setupExpressionGrammarDirect
	self setup: PP2ExpressionGrammar sources: 'expression'.
	parser name: 'Arithmetic Expressions (Direct)'.
	preferredRepetitions := 3.
	
	contextClass := PP2ImmutableSuccess.
	selector := #'parseDirectly:withContext:'