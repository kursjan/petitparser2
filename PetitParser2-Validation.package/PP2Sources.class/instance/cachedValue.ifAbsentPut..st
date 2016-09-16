caching
cachedValue: key ifAbsentPut: block
	^ cache at: key ifAbsentPut: block