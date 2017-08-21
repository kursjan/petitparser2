testing - pattern
testPatternExpression
	| addition bPattern |
	self parsePattern: '`a` + `b`' rule: #terms.
	
	addition := result children first.
	self assert: addition name = 'add'.
	
	bPattern := addition children third.
	self assert: bPattern isKindOf: PP2PatternParseNode.
	self assert: bPattern name = 'b'.