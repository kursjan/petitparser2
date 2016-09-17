test
testLiteralSequenceCaseInsensitive
	| parser |
	parser := 'abc' asPParser caseInsensitive.
	
	self assert: parser parse: 'abc' to: 'abc'.
	self assert: parser parse: 'ABC' to: 'ABC'.
	self assert: parser parse: 'abC' to: 'abC'.
	self assert: parser parse: 'AbC' to: 'AbC'.
	
	self assert: parser fail: 'ab'.
	self assert: parser fail: 'abd'