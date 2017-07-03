parsing
parseOn: aPP2Context
	| start retval |
	start := aPP2Context position.
	(retval := self pattern parseOn: aPP2Context) isPetit2Failure ifTrue: [ ^ retval ].

	^ aPP2Context newToken: PP2RewriteToken from: start