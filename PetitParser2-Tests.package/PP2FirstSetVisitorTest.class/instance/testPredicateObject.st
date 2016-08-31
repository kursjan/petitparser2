tests
testPredicateObject
	parser := #letter asParser2.
	firstSet := self firstSet: parser.

	self assert: firstSet size equals: 1.
	self assert: firstSet anyOne equals: parser.