parsing
parseOn: context
	| position retval start |
	position := context position.
	trimmer parseOn: context.
	
	start := context position.
	(retval := tokenChild parseOn: context) isPetit2Failure ifTrue: [ 
		context position: position.
		^ retval
	].
	retval := context newToken: tokenClass from: start.
	trimmer parseOn: context.

	^ retval