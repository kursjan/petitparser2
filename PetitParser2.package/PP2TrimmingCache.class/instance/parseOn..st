parsing
parseOn: context
	| retval |
	self invocation.
	(context position == lastTrimming) ifTrue: [ 
		self cacheHit: context.
		^ failure 
	].
	retval := strategy parseOn: context.
	lastTrimming := context position.
	^ retval