tests
testNotCS
	parser := $a asPParser push not.
	
	self denyCFMemoization: parser.