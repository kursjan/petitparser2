parsing
parseWithContext: startContext
	currentContext := startContext.
	
	^ (self visit: rootParser)
		startContext: startContext;
		yourself