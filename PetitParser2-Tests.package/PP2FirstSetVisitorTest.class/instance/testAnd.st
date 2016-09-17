tests
testAnd
	| sequence |
	parser := #letter asPParser.
	sequence := parser and, $b asPParser.
	firstSet := self firstSet: sequence.

	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parser.