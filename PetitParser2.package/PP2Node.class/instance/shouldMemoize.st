optimizations - caching
shouldMemoize
	^ self propertyAt: #memoize ifAbsent: false