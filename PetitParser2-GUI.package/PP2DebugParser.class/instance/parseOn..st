parsing - private
parseOn: startContext
	| resultContext |
	root parser: self.
	root stream: startContext stream.
	root start: 0.
	resultContext := child parseOn: startContext.
	root end: resultContext position.
	root result: resultContext value.
	^ resultContext