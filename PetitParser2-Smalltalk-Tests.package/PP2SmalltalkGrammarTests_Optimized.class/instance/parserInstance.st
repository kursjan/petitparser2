parsing
parserInstance
	^ super parserInstance optimize;
		resetCaches;
		yourself