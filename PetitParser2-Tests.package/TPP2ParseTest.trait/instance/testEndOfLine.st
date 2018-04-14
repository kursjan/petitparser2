test
testEndOfLine
	| parser |
	parser := #endOfLine asPParser.

	self assert: parser parse: '' to: nil.
	self assert: parser fail: 'a'.

	self assert: $a asPParser, parser parse: 'a'.