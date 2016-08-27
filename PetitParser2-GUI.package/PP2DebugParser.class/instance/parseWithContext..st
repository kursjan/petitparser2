parsing - private
parseWithContext: startContext
	| resultContext |
	root parser: self.
	root stream: startContext stream.
	root start: 0.
	resultContext := parser parseOn: startContext.
	root end: resultContext position.
	root result: resultContext value.
	^ resultContext