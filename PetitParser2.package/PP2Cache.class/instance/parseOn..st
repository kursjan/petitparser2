parsing
parseOn: context
	(context position == position) ifTrue: [ 
		context position: endPosition.
		^ retval
	].
	position := context position.
	retval := strategy parseOn: context.
	endPosition := context position.
	
	^ retval