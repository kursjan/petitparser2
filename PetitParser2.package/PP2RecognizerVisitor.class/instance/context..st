caching
context: node
	^ PP2RecognizerContext new
		node: node;
		inToken: self inToken;
		parent: self currentContext node;
		yourself