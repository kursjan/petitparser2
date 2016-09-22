caching
cacheResult: anObject for: context
	cache at: context ifPresent: [ self error: 'already cached' ].
	
	cache at: context put: anObject