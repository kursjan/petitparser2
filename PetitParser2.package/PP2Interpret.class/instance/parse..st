parsing
parse: input
	currentContext := PP2Success new initializeFor: 
		input asPetit2Stream;
		parser: rootParser;
		yourself.

	^ self visit: rootParser.
