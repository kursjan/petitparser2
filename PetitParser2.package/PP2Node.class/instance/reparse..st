reparsing
reparse: input
	self halt: 'deprecated'.
	^ (self reparseContext: input) returnValue