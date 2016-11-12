parsing
parse: aString rule: aSymbol to: expectedResult
	^ self parse: aString rule: aSymbol to: expectedResult end: aString size checkResult: true