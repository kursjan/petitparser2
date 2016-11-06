as yet unclassified
testSequencePush
	parser := $a asPParser, $b asPParser push, $c asPParser.
	
	self assertPushMemoization: parser.