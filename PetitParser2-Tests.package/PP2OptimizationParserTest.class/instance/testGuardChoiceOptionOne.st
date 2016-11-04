tests - guards
testGuardChoiceOptionOne
	| parserOne parserTwo wrappedOne wrappedTwo parser result |
	parserOne := $a asPParser.
	parserTwo := $b asPParser.

	wrappedOne := parserOne wrapped trim flatten. 
	wrappedTwo := parserTwo wrapped trim flatten.
	parser := wrappedOne / wrappedTwo.
	parser optimize.
	parser enableDebug.

	result := self assert: parser parse: 'a ' to: 'a '.
	self assert: result debugResult steps equals: 8