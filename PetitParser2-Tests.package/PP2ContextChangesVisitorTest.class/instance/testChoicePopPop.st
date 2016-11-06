tests
testChoicePopPop
	parser := $a asPParser pop / $b asPParser pop.
	
	self assertChangesContext: parser.
	self assertPop: parser