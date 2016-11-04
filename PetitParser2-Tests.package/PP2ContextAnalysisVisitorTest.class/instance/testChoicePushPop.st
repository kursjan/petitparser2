tests
testChoicePushPop
	parser := $a asPParser push / $b asPParser pop.
	
	self assertChangesContext: parser.
	self denyPush: parser.
	self denyPop: parser.