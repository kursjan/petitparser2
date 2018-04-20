accessing
parse: aStream withParser: aParser withContext: aContext
	^ (PP2Interpret  on: aParser) parse: aStream withContext: aContext