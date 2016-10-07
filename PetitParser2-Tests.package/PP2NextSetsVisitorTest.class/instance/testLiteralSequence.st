accessing
testLiteralSequence
	parser := 'foo' asPParser.
	
	self nextSet: parser in: parser.
	
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.