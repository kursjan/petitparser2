optimizations - caching
resetCaches
	self isOptimized ifFalse: [ ^ self ].
	self allCaches do: [ :cache | cache reset ].
	