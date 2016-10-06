tests
testLiteralObject
	parser := $a asPParser.
	firstSet := self firstSet: parser.

	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parser.