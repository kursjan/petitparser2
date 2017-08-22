parsing
parse: aStream withParser: aParser withContext: aContext
	| ctx |
	ctx := (aParser parse: aStream withContext: aContext).
	result := ctx returnValue.
	^ ctx