parsing
parse: aString production: production to: expectedResult end: end checkResult: aBoolean
	| ctx |
	ctx := self context.
	resultContext := self parse: aString withParser: production withContext: ctx.
	result := resultContext value.
	
	self
		deny: resultContext isPetit2Failure
		description: 'Unable to parse ' , aString printString.
	
	self assert: resultContext position equals: end.
	aBoolean ifTrue: [ self assert: expectedResult equals: result ].
	^ result