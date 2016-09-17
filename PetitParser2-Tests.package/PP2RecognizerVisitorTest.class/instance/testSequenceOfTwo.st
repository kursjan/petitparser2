tests
testSequenceOfTwo
	parser := $a asPParser, $b asPParser.
	parser strategy: (PP2SequenceOfTwo on: parser).
	token := parser token.
	
	self visit: token.
	
	self assert: parser strategy isKindOf: PP2SequenceOfTwoRecognizer 