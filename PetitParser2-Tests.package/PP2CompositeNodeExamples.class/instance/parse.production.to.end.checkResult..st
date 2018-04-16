accessing
parse: aString production: production to: expectedResult end: end checkResult: aBoolean
	| ctx resultContext result |
	ctx := self context.
	resultContext := self parse: aString withParser: production withContext: ctx.
	result := resultContext value.
	
	self
		assert: resultContext isPetit2Failure not
		description: 'Unable to parse ' , aString printString.
	
	self assert: resultContext position equals: end.
	aBoolean ifTrue: [ self assert: expectedResult equals: result ].
	^ result