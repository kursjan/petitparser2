test - parsing
testToken
	| parser |
	parser := $a asParser2 token.
	self assert: parser tokenClass equals: PP2Token.
	self
		assert: parser
		parse: 'a'
		toTokenValue: 'a'.
		
	self assert: parser fail: 'b'.
	self assert: parser fail: ''.