parsing
parse: input
	^ (self parseContext: input) returnValue