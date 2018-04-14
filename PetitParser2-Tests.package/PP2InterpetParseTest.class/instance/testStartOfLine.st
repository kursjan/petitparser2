test
testStartOfLine
	| parser |
	"
	  interpret does not support start of line, yet.
	"
	
	"
	parser := #startOfLine asPParser.

	self assert: parser parse: '' to: nil.
	self assert: parser parse: 'a' to: nil end: 0.

	self assert: $a asPParser, parser fail: 'ab' end: 1.
	"