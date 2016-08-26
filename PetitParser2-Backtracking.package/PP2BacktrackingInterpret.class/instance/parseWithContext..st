parsing
parseWithContext: context
	context continuationStack: Stack new.
	
	super parseWithContext: context.
	
	currentContext isPetit2Failure ifTrue: [ self backtrackIfPossible  ].
	^ currentContext