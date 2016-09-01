parsing
parseWithContext: context
	| result |
	result := super parseWithContext: context.
	result isPetit2Failure ifTrue: [ self backtrackIfPossible  ].
	^ result