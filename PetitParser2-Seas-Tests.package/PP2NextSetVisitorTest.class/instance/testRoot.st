accessing
testRoot
	parser := $a asParser2.
	
	self nextSet: parser.
	
	self assert: nextSet includes: PP2EndOfInputNode