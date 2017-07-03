parsing
parseOn: context
	| start retval |
	start := context position.
	(retval := node child parseOn: context) isPetit2Failure ifTrue: [ 
		^ self pattern parseOn: context 
	].

	^ context newToken: PP2RewriteToken from: start