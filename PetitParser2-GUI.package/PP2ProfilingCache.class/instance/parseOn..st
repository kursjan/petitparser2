parsing
parseOn: context
	| start |
	self invocation.
	(context position == position) ifTrue: [ 
		self cacheHit: context.
		context position: endPosition.
		^ retval
	].
	start := context position.
	retval := strategy parseOn: context.
	position := start.
	endPosition := context position.
	
	^ retval