parsing
parseDirectly: input withContext: startContext
	startContext stream: input asPetit2Stream.
	startContext position: 0.
	startContext parser: self.
	
	^ self parseOn: startContext