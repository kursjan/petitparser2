accessing
parse: aStream withParser: aParser withContext: aContext
	^ context := aParser parse: aStream withContext: aContext