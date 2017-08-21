parsing
parse: aString rule: aSymbol to: expectedResult end: end checkResult: aBoolean
	| production |
	production := self parserInstanceFor: aSymbol.
	^ self parse: aString production: production to: expectedResult end: end checkResult: aBoolean 	