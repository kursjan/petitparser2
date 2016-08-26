parsing
parse: aString rule: aSymbol to: expectedResult end: end
	^ self parse: aString rule: aSymbol  to:  expectedResult  end: end checkResult:  true