tests
testSequenceWithPop
	parser := $a asPParser, ($b asPParser pop).
	
	self assertChangesContext: parser.
	self assertPop: parser