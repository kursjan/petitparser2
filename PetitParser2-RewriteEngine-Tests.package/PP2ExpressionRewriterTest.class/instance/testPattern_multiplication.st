testing - pattern
testPattern_multiplication
	self parsePattern: '`a`' rule: #multiplication.
	self assert: result children first isKindOf: PP2PatternToken.
	self parse: '1 * 2' rule: #multiplication.
	self assert: result children first isKindOf: PP2ParseNode