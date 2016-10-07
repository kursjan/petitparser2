parsing
parseOn: context
	| parentDebugResult debugResult result |
	parentDebugResult := context currentDebugResult.
	
	debugResult := PP2DebugResult new
		parser: self node;
		start: context position + 1;
		parent: parentDebugResult;
		yourself.
	
	parentDebugResult children add: debugResult.
		
	context currentDebugResult: debugResult.
	result := strategy parseOn: context.
	context currentDebugResult: parentDebugResult.
	
	debugResult 
		stop: context position;
		result: result.
	
	^ result