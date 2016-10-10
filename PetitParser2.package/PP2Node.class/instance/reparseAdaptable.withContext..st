parsing - adaptable
reparseAdaptable: input withContext: context
	context stream: input asPetit2Stream.
	self halt: 'depr'.
	^ self parseAdaptableWithContext: context
	
