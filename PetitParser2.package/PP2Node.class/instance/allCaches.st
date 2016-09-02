optimizations - caching
allCaches
	^ self propertyAt: #allCaches ifAbsent: [
		self collectCaches
	]