tests
testSequenceWithMatch
	parser := $a asPParser, $b asPParser match.
	
	self assertIsContextSensitive: parser.