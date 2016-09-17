tests
testFlatten
	| flattened |
	parser := #letter asPParser.
	flattened := parser, #word asPParser star.
	firstSet := self firstSet: flattened.

	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parser.