tests
testAndPop
	parser := $a asPParser pop and.
	
	self assertPopMemoization: parser.