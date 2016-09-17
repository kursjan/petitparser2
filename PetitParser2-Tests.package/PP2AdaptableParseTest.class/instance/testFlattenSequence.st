test
testFlattenSequence
	| parser |
	parser := ($a asPParser, $b asPParser) flatten.
	
	self assert: parser parse: 'ab' to: 'ab'.
	
	self assert: parser fail: 'ac' end: 1.
	self assert: parser fail: 'bc'