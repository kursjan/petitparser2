reparsing
reparse: input withContext: startContext
	self halt: 'deprecated'.
	^ self reparseAdaptable: input withContext: startContext
