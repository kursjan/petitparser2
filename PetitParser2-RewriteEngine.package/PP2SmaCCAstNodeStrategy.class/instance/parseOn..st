parsing
parseOn: context
	| retval |
	(retval := node child parseOn: context) isPetit2Failure ifTrue: [ 
		| patternToken start |
		start := context position.
		patternToken := self pattern parseOn: context.
		patternToken isPetit2Failure ifTrue: [ ^ retval ].
		^  (PP2RewriteNode new)
			patternToken: (context newToken: PP2RewriteToken from: start);
			yourself
	].

	^ PP2RewriteNode new
		children: retval asCollection;
		completeSource: context asSmaCCString;
		yourself