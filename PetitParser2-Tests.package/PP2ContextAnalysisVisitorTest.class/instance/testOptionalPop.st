tests
testOptionalPop
	parser := $a asPParser pop optional.
	
	self assertChangesContext: parser.
	self denyPop: parser.