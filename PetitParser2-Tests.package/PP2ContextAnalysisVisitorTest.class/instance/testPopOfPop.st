tests
testPopOfPop
	parser := $a asPParser pop pop.
	
	self assertChangesContext: parser.
	self denyPop: parser.