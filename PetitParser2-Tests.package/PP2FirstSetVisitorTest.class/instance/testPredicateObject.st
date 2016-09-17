tests
testPredicateObject
	parser := #letter asPParser.
	firstSet := self firstSet: parser.

	self assert: firstSet size equals: 1.
	self assert: firstSet anyOne equals: parser.