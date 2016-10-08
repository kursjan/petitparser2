parsing - adaptable
parseAdaptable: input withContext: context
	context stream: input asPetit2Stream.
	context position: 0.
	context parser: self.

	^ self parseAdaptableWithContext: context
	
