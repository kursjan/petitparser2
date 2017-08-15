testing - pattern
testPattern
	self parse: '`a`' rule: #number checkResult: [ :r | r isKindOf: PP2PatternToken  ].
	self parse: '1' rule: #number checkResult: [ :r | r isKindOf: PP2Token  ].
	
	self parse: '`a`' rule: #addition checkResult: [ :r | r children first isKindOf: PP2PatternToken  ].
	self parse: '1 + 2' rule: #addition checkResult: [:r | r children first isKindOf: PP2Token ]