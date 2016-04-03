parsing
parse: input withContext: startContext
	| returnContext |
	startContext initializeFor: input asPetit2Stream parser: self.
	
	returnContext := rootParser backtrack parseWithContext: startContext.

	returnContext startContext: startContext.
	^ returnContext