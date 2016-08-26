parsing
parse: input
	^ self parseInterpreted: input withContext: PP2Context new.