tests
testSequenceWithPush
	parser := $a asPParser, $b asPParser push.
	
	self assertChangesContext: parser.
	self assertPush: parser