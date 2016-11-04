tests - guards
testGuardPlusFailure
	| result parser parserOne wrappedOne |
	parserOne := $a asPParser.
	wrappedOne := parserOne wrapped trim flatten. 
	parser := wrappedOne plus.
	parser optimize.
	parser enableDebug.

	result := self assert: parser fail: 'c'.
	self assert: result debugResult steps equals: 2