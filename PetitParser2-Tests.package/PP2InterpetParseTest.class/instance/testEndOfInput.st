test
testEndOfInput
	| parser |
	"
	  eoi not supported by interpret yet
	"
	"
	parser := #endOfInput asPParser.

	self assert: parser parse: '' to: nil.
	self assert: parser fail: 'a'.
	"