parsing - extras
parseDirectly: input withContext: context
	| retval startContext |
	
	startContext := context asImmutableContext.
	startContext stream: input asPetit2Stream.
	startContext position: 0.
	startContext parser: self.
	
	retval := self parseOn: startContext.
	retval startContext: startContext.
	
	^ retval