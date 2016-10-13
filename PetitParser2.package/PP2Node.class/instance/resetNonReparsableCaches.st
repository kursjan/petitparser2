optimizations - caching
resetNonReparsableCaches
	self isOptimized ifFalse: [ ^ self ].
	self allCaches reject: [:e | e isReparsable ] thenDo: [ :cache | cache reset ].
	