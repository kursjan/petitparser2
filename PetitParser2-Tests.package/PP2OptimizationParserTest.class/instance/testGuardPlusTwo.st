tests - guards
testGuardPlusTwo
	| parserOne wrappedOne parser result |
	parserOne := $a asPParser.
	wrappedOne := parserOne wrapped trim flatten. 
	parser := wrappedOne plus.
	parser optimize.
	parser enableDebug.

	result := self assert: parser parse: 'aa' to: #('a' 'a') end: 2.
	self assert: result debugResult steps equals: 19