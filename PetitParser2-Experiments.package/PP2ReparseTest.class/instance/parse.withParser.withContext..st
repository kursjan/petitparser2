accessing
parse: aStream withParser: aParser withContext: aContext
	^ aParser optimize enableDebug parseAdaptable: aStream withContext: aContext