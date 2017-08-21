parsing
parsePattern: patternInput rule: aSymbol
	| production |
	production := (self parserInstanceFor: aSymbol) enablePatternMatching.
	^ self parse: patternInput production: production to: nil end: patternInput size checkResult: false