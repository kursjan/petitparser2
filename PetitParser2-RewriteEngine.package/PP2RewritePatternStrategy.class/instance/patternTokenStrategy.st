accessing
patternTokenStrategy
	patternTokenStrategy ifNil: [ 
		patternTokenStrategy := PP2RewritePatternTokenStrategy new
	].
	^ patternTokenStrategy 