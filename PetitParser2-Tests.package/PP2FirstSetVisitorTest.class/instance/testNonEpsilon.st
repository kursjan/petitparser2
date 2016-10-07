tests
testNonEpsilon
	| terminal |
	terminal := $b asPParser.
	parser := terminal optional nonEpsilon.
	
	firstSet := self firstSet: parser.
	
	self assert: firstSet size equals: 1.
	self assert: firstSet includes: terminal.