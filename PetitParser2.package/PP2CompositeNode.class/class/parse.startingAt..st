parsing
parse: anObject startingAt: aSymbol
	^ (self newStartingAt: aSymbol) parse: anObject