test
testDelegateWithEndOfInput
	| parser |
	parser := ($a asPParser / #eoi asPParser) wrapped.
	
	self assert: parser parse: 'a' to: $a.
	self assert: parser parse: '' to: nil.

	self assert: parser fail: 'b'.