optimizations - caching
shouldCache
	^ self propertyAt: #cacheAllowed ifAbsent: [ ^ false ]