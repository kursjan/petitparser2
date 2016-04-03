tests
testToken
	| parser |
	parser := $a asParser2 token.

	self
		assert: parser
		parse: 'a'
		toTokenValue: 'a'.
		
	self assert: parser fail: 'b'.
	self assert: parser fail: ''.