tests
testNot
	| sequence |
	parser := $a asParser2 not.
	sequence := parser, $b asParser2.
	firstSet := self firstSet: sequence.

	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parser.