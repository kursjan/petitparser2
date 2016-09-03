initialization
initialize
	super initialize.
	
	parser := PP2ExpressionGrammar new.
	optimizedParser := PP2ExpressionGrammar new optimize