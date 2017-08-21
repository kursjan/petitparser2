testing - pattern
testPattern_addition
	self parsePattern: '`a`' rule: #addition.
	self assert: result children first isKindOf: PP2PatternToken.
	self parse: '1 + 2' rule: #addition.
	self assert: result children first isKindOf: PP2ParseNode