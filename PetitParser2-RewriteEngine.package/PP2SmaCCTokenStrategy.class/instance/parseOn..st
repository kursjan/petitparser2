parsing
parseOn: context
	| start retval |
	start := context position.
	(retval := node child parseOn: context) isPetit2Failure ifTrue: [ 
		"TODO JK: avoid instance creation"
		^ PP2RewritePatternTokenStrategy new parseOn: context 
	].

	^ context newToken: PP2PatternToken from: start