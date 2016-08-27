as yet unclassified
visit: aPP2Parser
	| startContext result |
	startContext := currentContext.

	result := PP2ParserDebuggerResult new
		parser: aPP2Parser;
		parent: currentResult;
		start: currentContext position + 1;
		yourself.

	currentResult := result.
	currentContext := (super visit: aPP2Parser).
	currentResult := result parent.	
	currentResult children add: result.
	
	result 
		end: currentContext position;
		result: currentContext value;
		yourself.	

	^ currentContext