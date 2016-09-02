caching
cacheResult: anObject for: aPP2Parser
	self shouldRevisit not ifTrue: [  
		cache at: aPP2Parser ifPresent: [ self error: 'already cached' ].
	].
	
	cache at: aPP2Parser put: anObject