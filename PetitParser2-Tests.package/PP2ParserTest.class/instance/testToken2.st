test - parsing
testToken2
	| parser |
	parser := 'foo' asParser2 token.
	self assert: parser tokenClass equals: PP2Token.
	self
		assert: parser
		parse: 'foo'
		toTokenValue: 'foo'.
		
	self assert: parser fail: 'bar'.
	self assert: parser fail: ''.