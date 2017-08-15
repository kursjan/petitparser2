parsing
parseOn: context
	| retval startPosition |
	startPosition := context start.
	(retval := node child parseOn: context) isPetit2Failure ifTrue: [ 
		| patternToken |
		"TODO JK: avoid instnace creation"
		patternToken := PP2RewritePatternTokenStrategy new parseOn: context.
		patternToken isPetit2Failure ifTrue: [ ^ retval ].
		^  (PP2PatternParseNode new)
			patternToken: patternToken;
			name: node nodeName;
			yourself
	].

	^ PP2ParseNode new
		children: retval asCollection;
		startPosition: (startPosition + 1);
		stopPosition: context position;
		name: node nodeName;
		yourself