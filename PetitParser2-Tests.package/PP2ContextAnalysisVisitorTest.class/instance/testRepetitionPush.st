tests
testRepetitionPush
	parser := $a asPParser push star.
	
	self assertChangesContext: parser.
	self denyPush: parser.