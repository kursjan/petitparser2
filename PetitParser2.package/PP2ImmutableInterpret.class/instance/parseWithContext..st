parsing
parseWithContext: context
	| startContext |
	startContext := context asImmutableContext.
	
	currentContext := startContext.
	
	^ (self visit: rootParser)
		startContext: startContext;
		yourself