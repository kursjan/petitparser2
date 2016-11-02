parsing
fail: aString rule: aSymbol 
	| production context |
	production := self parserInstanceFor: aSymbol.
	context := self context.
	
	result := production parse: aString withContext: context.
	
	self
		assert: (result isPetit2Failure or: [context atEnd not])
		description: 'Able to parse ' , aString printString.
	^ result