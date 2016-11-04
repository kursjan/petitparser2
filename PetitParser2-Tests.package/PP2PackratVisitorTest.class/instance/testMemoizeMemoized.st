tests
testMemoizeMemoized
	parser := $a asPParser memoize memoize.
	
	self assertMemoized: parser.
	self assert: parser strategies size equals: 2.