tests
testMemoizeMatch
	parser := $a asPParser match memoize.
	
	self assertMemoized: parser.