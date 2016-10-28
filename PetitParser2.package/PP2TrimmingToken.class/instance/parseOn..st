parsing
parseOn: context
	| position retval start |
	position := context rememberPosition.
	trimmer parseOn: context.

	start := context position.
	(retval := tokenChild parseOn: context) isPetit2Failure ifTrue: [ 
		context restorePosition: position.
		^ retval
	].
	retval := context newToken: tokenClass from: start.
	trimmer parseOn: context.

	^ retval