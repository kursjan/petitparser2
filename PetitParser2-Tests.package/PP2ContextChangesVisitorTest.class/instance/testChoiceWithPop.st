tests
testChoiceWithPop
	parser := $a asPParser / $b asPParser pop.
	
	self assertChangesContext: parser.
	self denyPop: parser