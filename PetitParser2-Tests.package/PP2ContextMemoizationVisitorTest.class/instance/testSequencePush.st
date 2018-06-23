tests
testSequencePush
	parser := $a asPParser, $b asPParser push, $c asPParser.
	
	self assertPushMemoization: parser.