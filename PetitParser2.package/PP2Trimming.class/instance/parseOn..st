parsing
parseOn: aPP2Context
	| position retval |
	position := aPP2Context position.
	[ (node trimmer parseOn: aPP2Context) isPetit2Failure ] whileFalse.
	
	(retval := node child parseOn: aPP2Context) isPetit2Failure ifTrue: [ 
		aPP2Context position: position.
		^ retval
	].
	
	[ (node trimmer parseOn: aPP2Context) isPetit2Failure ] whileFalse.

	^ retval