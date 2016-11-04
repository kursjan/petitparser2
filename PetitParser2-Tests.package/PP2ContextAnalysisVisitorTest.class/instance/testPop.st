tests
testPop
	parser := $a asPParser pop.
	
	self assertChangesContext: parser.
	self assertPop: parser.