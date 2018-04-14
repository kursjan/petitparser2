test
testEndOfInput
	| parser |
	parser := #endOfInput asPParser.

	self assert: parser parse: '' to: nil.
	self assert: parser fail: 'a'.