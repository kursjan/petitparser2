test
testLiteralSequence
	| parser |
	parser := 'abc' asPParser.
	
	self assert: parser parse: 'abc' to: 'abc'.
	self assert: parser parse: 'abcd' to: 'abc' end: 3.

	self assert: parser fail: 'ab'.
	self assert: parser fail: 'abd'