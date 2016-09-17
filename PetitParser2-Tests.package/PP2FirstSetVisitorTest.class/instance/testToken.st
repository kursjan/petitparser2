tests
testToken
	| token |
	parser := 'foo' asPParser.
	token := parser token.
	firstSet := self firstSet: token.

	self assert: firstSet size equals: 1.
	self assert: firstSet anyOne equals: parser.