parsing
parse: input withContext: startContext
	startContext stream: input asPetit2Stream.
	startContext position: 0.
	startContext parser: rootParser.
	
	^ self parseWithContext: startContext