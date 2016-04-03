as yet unclassified
parse: input
	currentContext := PP2Success new initializeFor: 
		input asPetit2Stream;
		parser: parser;
		yourself.

	currentResult := PPParserDebuggerResult new.
		
	self visit: parser.
	^ currentResult