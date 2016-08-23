caching
cachedValue: key ifAbsent: block
	^ cache at: key ifAbsentPut: [ block value ]