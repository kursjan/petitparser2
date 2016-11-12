parsing
parse: aString rule: aSymbol to: expectedResult end: end checkResult: aBoolean
	| production ctx |
	production := self parserInstanceFor: aSymbol.
	ctx := self context.
	resultContext := self parse: aString withParser: production withContext: ctx.
	result := resultContext value.
	
	self
		deny: resultContext isPetit2Failure
		description: 'Unable to parse ' , aString printString.
	
	self assert: resultContext position equals: end.
	aBoolean ifTrue: [ self assert: expectedResult equals: result ].
	^ result