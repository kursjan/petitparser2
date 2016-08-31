parsing
parseOn: aPP2Context
	| retval |
		
	(retval := node child parseOn: aPP2Context) isPetit2Failure ifTrue: [
		^ retval
	].

	(node max - 1) timesRepeat: [
	 	(retval := node child parseOn: aPP2Context) isPetit2Failure ifTrue: [ 
			^ self 
		].
	].

