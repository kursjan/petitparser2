tests
testEndOfInput
	parser := PP2EndOfInputNode new.
	
	firstSet := self firstSet: parser.
	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parser.