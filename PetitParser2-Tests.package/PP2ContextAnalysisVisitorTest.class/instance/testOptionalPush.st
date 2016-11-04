tests
testOptionalPush
	parser := $a asPParser push optional.
	
	self assertChangesContext: parser.
	self denyPush: parser.