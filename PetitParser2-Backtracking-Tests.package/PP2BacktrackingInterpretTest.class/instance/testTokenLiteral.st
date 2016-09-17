test
testTokenLiteral
	| parser |
	parser := 'foo' asPParser token.

	self assert: parser parse: 'foo' toTokenValue: 'foo'.
		
	self assert: parser fail: 'bar'.
	self assert: parser fail: ''.