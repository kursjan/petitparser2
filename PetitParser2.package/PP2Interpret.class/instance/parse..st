parsing
parse: input
	| startContext |
	startContext := PP2Success new 
		initializeFor: input asPetit2Stream;
		parser: rootParser;
		yourself.
	^ self parseWithContext: startContext
