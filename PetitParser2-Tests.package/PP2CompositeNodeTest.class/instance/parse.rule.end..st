parsing
parse: aString rule: aSymbol end: end
	^ self parse: aString rule: aSymbol to: nil end: end checkResult: false