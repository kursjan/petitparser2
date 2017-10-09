*PetitParser2-RewriteEngine
parseAndCacheAllPossibleStates: source
	| result | 
	
	result := self new enablePatternMatching parse: source.
	self assert: result isPetit2Success.
	^ Array with: result