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
			yourself
	].

	^ PP2ParseNode new
		children: retval asCollection;
		completeSource: context asSmaCCString;
		startPosition: (startPosition + 1);
		stopPosition: context position;
		yourself