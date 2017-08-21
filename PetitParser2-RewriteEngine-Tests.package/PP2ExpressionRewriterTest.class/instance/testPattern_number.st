testing - pattern
testPattern_number
	self parsePattern: '`a`' rule: #number.
	self assert: result isPatternParseNode.
	self assert: result name = 'a'.
	
	self parse: '1' rule: #number.
	self assert: result isKindOf: PP2Token