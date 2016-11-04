tests
testChoicePushPush
	parser := $a asPParser push / $b asPParser push.
	
	self assertChangesContext: parser.
	self assertPush: parser