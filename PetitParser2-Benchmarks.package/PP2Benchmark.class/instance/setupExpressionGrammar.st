benchmarks - expression grammar
setupExpressionGrammar
	self setup: PP2ExpressionGrammar sources: 'expression'.
	parser name: 'Arithmetic Expressions'.
	self parser optimize.
	
	contextClass := PP2InMemoryContext.
	selector := #'parseAdaptable:withContext:'.
	preferredRepetitions := 3