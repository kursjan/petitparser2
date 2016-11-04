tests
testPushOfPush
	parser := $a asPParser push push.
	
	self assertChangesContext: parser.
	self denyPush: parser