tests
testFlatten
	| flattened |
	parser := #letter asParser2.
	flattened := parser, #word asParser2 star.
	firstSet := self firstSet: flattened.

	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parser.