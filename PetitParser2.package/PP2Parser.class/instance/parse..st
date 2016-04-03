parsing
parse: input
	| startContext |
	startContext := PP2Success new.
	^ self parse: input withContext: startContext
