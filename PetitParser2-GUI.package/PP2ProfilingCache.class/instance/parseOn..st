parsing
parseOn: context
	self invocation.
	(context position == position) ifTrue: [ 
		self cacheHit: context.
		context position: endPosition.
		^ retval
	].
	position := context position.
	retval := strategy parseOn: context.
	endPosition := context position.
	
	^ retval