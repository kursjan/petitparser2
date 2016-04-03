parsing
parseWithContext: context
	super parseWithContext: context.
	
	currentContext isPetit2Failure ifTrue: [ self backtrackIfPossible  ].
	^ currentContext