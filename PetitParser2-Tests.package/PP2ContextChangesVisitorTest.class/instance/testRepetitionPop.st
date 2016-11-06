tests
testRepetitionPop
	parser := $a asPParser pop star.
	
	self assertChangesContext: parser.
	self denyPush: parser.