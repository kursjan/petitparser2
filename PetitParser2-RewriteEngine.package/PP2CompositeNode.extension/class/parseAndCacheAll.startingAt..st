*PetitParser2-RewriteEngine
parseAndCacheAll: source startingAt: startingIndex
	^ Array  with: (self parse: source)