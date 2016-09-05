parsing
parse: anObject startingAt: aSymbol onError: aBlock
	^ (self newStartingAt: aSymbol) parse: anObject onError: aBlock