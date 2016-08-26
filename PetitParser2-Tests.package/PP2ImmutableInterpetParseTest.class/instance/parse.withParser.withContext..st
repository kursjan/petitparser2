accessing
parse: aStream withParser: aParser withContext: aContext
	^ (PP2ImmutableInterpret  on: aParser) parse: aStream withContext: aContext