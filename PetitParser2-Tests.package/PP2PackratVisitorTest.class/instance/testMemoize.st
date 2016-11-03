tests
testMemoize
	parser := $a asPParser memoize.
	
	self assertMemoized: parser.