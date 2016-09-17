tests
testSequenceOfThree
	parser := $a asPParser, $b asPParser, $c asPParser.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2SequenceOfThree.