tests
testPush
	parser := $a asPParser push.
	
	self assertChangesContext: parser.
	self assertPush: parser