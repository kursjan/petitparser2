tests
testSequenceWithPushPop
	parser := $a asPParser push, $b asPParser pop.
	
	self denyChangesContext: parser