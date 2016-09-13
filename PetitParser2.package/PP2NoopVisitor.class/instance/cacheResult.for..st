caching
cacheResult: anObject for: node
	cache at: node ifPresent: [ self error: 'already cached' ].
	
	cache at: node put: anObject