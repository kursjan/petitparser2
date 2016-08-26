parsing
parse: input
	^ self parseInterpreted: input withContext: PP2Success new.