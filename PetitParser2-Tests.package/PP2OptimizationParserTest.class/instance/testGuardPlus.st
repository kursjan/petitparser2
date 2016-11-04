tests - guards
testGuardPlus
	| parserOne wrappedOne result parser |
	parserOne := $a asPParser.
	wrappedOne := parserOne wrapped trim flatten. 
	parser := wrappedOne plus.
	parser optimize.
	parser enableDebug.

	result := self assert: parser parse: 'a' to: #('a') end: 1.
	self assert: result debugResult steps equals: 13