tests
testSequenceOfTwo
	parser := $a asPParser, $b asPParser.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2SequenceOfTwo.