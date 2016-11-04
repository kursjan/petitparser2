tests
testMemoizePush
	parser := $a asPParser push memoize.
	
	self denyMemoized: parser.
	self assert: parser warnings size equals: 1.