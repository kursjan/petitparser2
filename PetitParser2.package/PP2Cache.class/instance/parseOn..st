parsing
parseOn: context
	invocations := invocations + 1.
	(context position == position and: [id == context id]) ifTrue: [ 
		hits := hits + 1.
		context position: endPosition.
		^ retval
	].
	position := context position.
	retval := strategy parseOn: context.
	endPosition := context position.
	id := context id.
	
	^ retval