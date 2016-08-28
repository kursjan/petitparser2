parsing
parseOn: aPP2Context
	| parentDebugResult debugResult result |
	parentDebugResult := aPP2Context debugResult.
	
	debugResult := PPParserDebuggerResult new
		parser: self node;
		start: aPP2Context position + 1;
		parent: parentDebugResult;
		yourself.
	
	parentDebugResult children add: debugResult.
		
	aPP2Context debugResult: debugResult.
	result := strategy parseOn: aPP2Context.
	aPP2Context debugResult: parentDebugResult.
	
	debugResult 
		end: aPP2Context position;
		result: result.
	
	^ result