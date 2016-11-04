tests - guards
testGuardChoiceFailure
	| parserOne parserTwo wrappedOne wrappedTwo result parser |
	parserOne := $a asPParser.
	parserTwo := $b asPParser.

	wrappedOne := parserOne wrapped trim flatten. 
	wrappedTwo := parserTwo wrapped trim flatten.
	parser := wrappedOne / wrappedTwo.
	parser optimize.
	parser enableDebug.
		
	result := self assert: parser fail: 'c'.
	self assert: result debugResult steps equals: 4