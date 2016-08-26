benchmarks - expression grammar
setupExpressionParser
	self setup: PP2ExpressionParser sources: 'expression'.
	parser name: 'Arithmetic Expressions Parser'.
	preferredRepetitions := 3.
	
	contextClass := PP2Context.