tests
parse: aStream withParser: aParser withContext: aContext
	^ (PP2BacktrackingInterpret on: aParser) parse: aStream withContext: aContext