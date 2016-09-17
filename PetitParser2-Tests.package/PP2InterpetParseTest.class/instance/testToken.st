test
testToken
	| parser |
	parser := $a asPParser token.

	self assert: parser parse: 'a'	toTokenValue: 'a'.
		
	self assert: parser fail: 'b'.
	self assert: parser fail: ''.