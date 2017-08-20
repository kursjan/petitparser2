testing - pattern
testPattern
	self parse: '`a`' rule: #number.
	self assert: result isKindOf: PP2PatternToken.
	self parse: '1' rule: #number.
	self assert: result isKindOf: PP2Token.
	
	self parse: '`a`' rule: #addition.
	self assert: result children first isKindOf: PP2PatternToken.
	self parse: '1 + 2' rule: #addition.
	self assert: result children first isKindOf: PP2ParseNode