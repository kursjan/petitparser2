caching
cacheResult: anObject for: node
	(self shouldRevisit: node) not ifTrue: [  
		cache at: node ifPresent: [ self error: 'already cached' ].
	].
	
	cache at: node put: anObject