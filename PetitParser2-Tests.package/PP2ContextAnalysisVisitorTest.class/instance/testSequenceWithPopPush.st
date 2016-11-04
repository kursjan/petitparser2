tests
testSequenceWithPopPush
	parser := $a asPParser pop, $b asPParser push.
	
	self assertChangesContext: parser