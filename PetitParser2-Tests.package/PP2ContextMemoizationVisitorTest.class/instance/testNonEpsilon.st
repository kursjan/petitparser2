tests
testNonEpsilon
	parser := $a asPParser nonEpsilon.
	
	self assertCFMemoization: parser.