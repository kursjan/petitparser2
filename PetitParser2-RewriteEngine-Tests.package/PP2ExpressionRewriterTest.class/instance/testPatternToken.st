testing - pattern
testPatternToken
	self parse: '`a`' rule: #number.
	self assert: result isKindOf: PP2PatternToken.
	self parse: '`b`' rule: #number.
	self assert: result name = 'b'.
	