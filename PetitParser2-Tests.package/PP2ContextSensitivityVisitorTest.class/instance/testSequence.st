tests
testSequence
	parser := $a asPParser, $b asPParser.
	
	self denyIsContextSensitive: parser.