benchmarks - expression grammar
setupExpressionGrammarNoOpt
	self setup: PP2ExpressionGrammar sources: 'expression'.
	parser name: 'Arithmetic Expressions (NoOpt)'.
	preferredRepetitions := 3.
	
	contextClass := PP2Context.
	selector := #'parseAdaptable:withContext:'.
	preferredRepetitions := 3.
