testing - pattern
testPatternToken
	self parse: '`a`' rule: #number checkResult: [ :r | r isKindOf: PP2PatternToken  ].
	self parse: '`b`' rule: #number checkResult: [ :r | r name = 'b'  ].
	