parsing
parseOn: context
	(context position == position and: [id == context]) ifTrue: [ 
		context position: endPosition.
		^ retval
	].
	position := context position.
	retval := strategy parseOn: context.
	endPosition := context position.
	id := context.
	
	^ retval