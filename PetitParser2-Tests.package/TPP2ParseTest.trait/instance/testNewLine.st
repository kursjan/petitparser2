test
testNewLine
	| parser |
	parser := #newline asPParser.

	self assert: parser parse: '
' to: Character cr.
	self assert: parser fail: ''