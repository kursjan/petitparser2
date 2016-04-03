parsing
parse: aString rule: aSymbol
	| production context |
	production := self parserInstanceFor: aSymbol.
	context := self context.
	
	result := production end parse: aString withContext: context.
	self
		deny: result isPetit2Failure
		description: 'Unable to parse ' , aString printString.
	^ result