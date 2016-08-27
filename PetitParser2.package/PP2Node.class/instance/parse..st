parsing
parse: input
	^ self parseAdaptable: input withContext: PP2Context new.