caching
cacheResult: anObject for: aPP2Parser
	cache at: aPP2Parser ifPresent: [ self error: 'already cached' ].
	
	cache at: aPP2Parser put: anObject