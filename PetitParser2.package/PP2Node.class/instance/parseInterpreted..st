parsing - interpretation
parseInterpreted: input
	^ self parseInterpreted: input withContext: PP2Context new.