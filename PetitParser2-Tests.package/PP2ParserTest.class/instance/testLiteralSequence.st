test - parsing (deprecated)
testLiteralSequence
	| parser |
	parser := 'abc' asParser2.
	
	self assert: parser size equals: 3.
	self assert: parser literal equals: 'abc'.
	self assert: parser message equals: 'literal ''abc'' expected'.
	
	self assert: parser parse: 'abc' to: 'abc'.
	self assert: parser parse: 'abcd' to: 'abc' end: 3.

	self assert: parser fail: 'ab'.
	self assert: parser fail: 'abd'