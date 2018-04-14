test
testEndOfLine
	| parser |
	"
		end of line is not yet supported by interpret
	"
	"
	parser := #endOfLine asPParser.

	self assert: parser parse: '' to: nil.
	self assert: parser fail: 'a'.

	self assert: $a asPParser, parser parse: 'a'.
	"