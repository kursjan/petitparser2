*PetitParser2-RewriteEngine
parseAndCacheAll: source startingAt: startingIndex
	self flag: 'JK: you are ignoring starting index!'.
	
	^ Array  with: (self new enablePatternMatching parse: source)