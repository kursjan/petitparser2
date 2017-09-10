*PetitParser2-RewriteEngine
parseAndCacheAllPossibleStates: source
	^ Array  with: (self new enablePatternMatching parse: source)