tests
testSmalltalkIdentier
	| parser result |
	parser := PPSmalltalkGrammar new identifierToken.

	result := parser parse: 'foo'.
	self assert: result isPetit2Success.
	self assert: result value inputValue = 'foo'.