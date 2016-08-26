parsing
parseWithContext: context
	| startContext |
	startContext := context asImmutableContext.
	
	startContext continuationStack: Stack new.
	
	super parseWithContext: startContext.
	
	currentContext isPetit2Failure ifTrue: [ self backtrackIfPossible  ].
	^ currentContext