parsing
parseOn: aPP2Context
	| start retval |
	start := aPP2Context position.
	(retval := node child parseOn: aPP2Context) isPetit2Failure ifTrue: [ ^ retval ].

	^ aPP2Context newToken: (node tokenClass) from: start