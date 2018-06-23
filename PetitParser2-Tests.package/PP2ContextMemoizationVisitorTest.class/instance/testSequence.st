tests
testSequence
	parser := $a asPParser, $b asPParser match, $c asPParser.
	
	self assertCFMemoization: parser.