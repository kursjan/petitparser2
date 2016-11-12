as yet unclassified
testNonEpsilon
	parser := $a asPParser nonEpsilon.
	
	self assertCFMemoization: parser.