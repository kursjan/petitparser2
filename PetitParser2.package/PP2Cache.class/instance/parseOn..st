parsing
parseOn: context
	invocations := invocations + 1.
	(context position == position) ifTrue: [ 
		hits := hits + 1.
		context cacheHit.
		context position: endPosition.
		^ retval
	].
	position := context position.
	retval := strategy parseOn: context.
	endPosition := context position.
	
	^ retval