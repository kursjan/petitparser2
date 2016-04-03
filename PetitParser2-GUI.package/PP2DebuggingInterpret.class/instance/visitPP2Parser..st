as yet unclassified
visitPP2Parser: aPP2Parser
	| startContext result |
	startContext := currentContext.

	result := PPParserDebuggerResult new
		parser: aPP2Parser;
		parent: currentResult;
		start: currentContext position + 1.

	currentResult := result.
	currentContext := (aPP2Parser parseOn: currentContext)
		startContext: startContext;
		yourself.
	currentResult := result parent.	
	currentResult children add: result.
	
	result 
		end: currentContext position;
		result: currentContext value;
		yourself.	

	^ currentContext