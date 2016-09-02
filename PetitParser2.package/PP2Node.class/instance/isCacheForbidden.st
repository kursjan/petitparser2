optimizations - caching
isCacheForbidden
	(self hasProperty: #cacheAllowed) ifTrue: [ 
		^ (self propertyAt: #cacheAllowed) not
	].
	^ false