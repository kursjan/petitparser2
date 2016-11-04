tests
testSeaWithCSIsland
	parser := $a asPParser match sea.
	
	self assertIsContextSensitive: parser.