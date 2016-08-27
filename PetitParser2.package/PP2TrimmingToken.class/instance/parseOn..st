parsing
parseOn: aPP2Context
	| position retval start |
	position := aPP2Context position.
	[ (node trimmer parseOn: aPP2Context) isPetit2Failure ] whileFalse.
	
	start := aPP2Context position.
	(retval := node child parseOn: aPP2Context) isPetit2Failure ifTrue: [ 
		aPP2Context position: position.
		^ retval
	].
	retval := aPP2Context newToken: (node tokenClass) from: start.
	
	[ (node trimmer parseOn: aPP2Context) isPetit2Failure ] whileFalse.

	^ retval