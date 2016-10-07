parsing
parseOn: context
	| parentDebugResult debugResult result |
	parentDebugResult := context debugResult.
	
	debugResult := PP2DebugResult new
		parser: self node;
		start: context position + 1;
		parent: parentDebugResult;
		yourself.
	
	parentDebugResult children add: debugResult.
		
	context debugResult: debugResult.
	result := strategy parseOn: context.
	context debugResult: parentDebugResult.
	
	debugResult 
		stop: context position;
		result: result.
	
	^ result