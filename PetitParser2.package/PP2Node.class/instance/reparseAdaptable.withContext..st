parsing - adaptable
reparseAdaptable: input withContext: context
	context stream: input asPetit2Stream.

	^ self parseAdaptableWithContext: context
	
