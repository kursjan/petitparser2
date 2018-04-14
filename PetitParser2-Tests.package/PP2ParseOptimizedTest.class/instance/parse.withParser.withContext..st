parsing
parse: aStream withParser: aParser withContext: aContext
	^ aParser optimize parseAdaptable: aStream withContext: aContext