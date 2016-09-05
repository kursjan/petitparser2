parsing
parse: anObject onError: aBlock
	^ self parse: anObject startingAt: self startSymbol onError: aBlock