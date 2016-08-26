test
testTokenLiteral
	| parser |
	parser := 'foo' asParser2 token.

	self assert: parser parse: 'foo' toTokenValue: 'foo'.
		
	self assert: parser fail: 'bar'.
	self assert: parser fail: ''.