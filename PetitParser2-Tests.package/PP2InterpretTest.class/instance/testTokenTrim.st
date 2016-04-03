tests
testTokenTrim
	| parser |
	parser := $a asParser2 token trim.
	
	self assert: parser parse: 'a' toTokenValue: 'a'.
	self assert: parser parse: ' a' toTokenValue: 'a'.
	self assert: parser parse: 'a ' toTokenValue: 'a' end: 2.
	self assert: parser parse: ' a ' toTokenValue: 'a' end: 3.
	self assert: parser parse: '  a  ' toTokenValue: 'a' end: 5.

	self assert: parser fail: 'b'.