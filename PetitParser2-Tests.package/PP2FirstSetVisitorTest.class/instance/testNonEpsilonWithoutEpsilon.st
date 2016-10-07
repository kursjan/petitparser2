tests
testNonEpsilonWithoutEpsilon
	| terminal |
	terminal := $b asPParser.
	parser := terminal nonEpsilon.
	
	firstSet := self firstSet: parser.
	
	self assert: firstSet size equals: 1.
	self assert: firstSet includes: terminal.