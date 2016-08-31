tests
testStartOfLine
	parser := #startOfLine asParser2.
	firstSet := self firstSet: parser.

	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parser