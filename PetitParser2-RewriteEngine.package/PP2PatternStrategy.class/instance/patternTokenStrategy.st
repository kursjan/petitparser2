accessing
patternTokenStrategy
	patternTokenStrategy ifNil: [ 
		patternTokenStrategy := PP2PatternTokenStrategy new
	].
	^ patternTokenStrategy 