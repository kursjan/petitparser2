tests
testLiteralSequence
	| parser |
	parser := 'abc' asParser2.
	
	self assert: parser parse: 'abc' to: 'abc'.
	self assert: parser parse: 'abcd' to: 'abc' end: 3.

	self assert: parser fail: 'ab'.
	self assert: parser fail: 'abd'