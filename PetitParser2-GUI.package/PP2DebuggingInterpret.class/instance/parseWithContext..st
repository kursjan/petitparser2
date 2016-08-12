as yet unclassified
parseWithContext: startContext
	| stopContext |
	currentResult := PPParserDebuggerResult new
		stream: startContext stream;
		start: startContext position;
		yourself.
		
	stopContext := super parseWithContext: startContext.
	currentResult end: stopContext position.
	^ currentResult