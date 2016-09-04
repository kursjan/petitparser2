optimizations - caching
refreshCaches
	^ self propertyAt: #allCaches put: self collectCaches