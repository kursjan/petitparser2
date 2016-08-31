tests
testAnd
	| sequence |
	parser := #letter asParser2.
	sequence := parser and, $b asParser2.
	firstSet := self firstSet: sequence.

	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parser.