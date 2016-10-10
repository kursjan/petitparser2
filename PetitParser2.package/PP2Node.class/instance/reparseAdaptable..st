parsing - adaptable
reparseAdaptable: input
	self halt: 'deprecated'.
	^ self reparseAdaptableWithContext: input asPetit2Stream asPetit2Context