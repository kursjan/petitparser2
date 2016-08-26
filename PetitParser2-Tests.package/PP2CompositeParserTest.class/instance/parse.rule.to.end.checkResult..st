parsing
parse: aString rule: aSymbol to: expectedResult end: end checkResult: aBoolean
	| production context |
	production := self parserInstanceFor: aSymbol.
	context := self context.
	
	resultContext := production perform: self parseSelector withArguments: { aString . context }.
	result := resultContext value.
	
	self
		deny: resultContext isPetit2Failure
		description: 'Unable to parse ' , aString printString.
	
	self assert: resultContext position equals: end.
	aBoolean ifTrue: [ self assert: expectedResult equals: result ].
	^ result