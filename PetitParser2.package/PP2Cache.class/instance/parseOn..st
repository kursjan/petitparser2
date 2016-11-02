parsing
parseOn: context
	| start |
	(context position == position) ifTrue: [ 
		context position: endPosition.
		^ retval
	].
	start := context position.
	retval := strategy parseOn: context.
	position := start.
	endPosition := context position.
	
	^ retval