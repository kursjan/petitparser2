tests
testMemoizePop
	parser := $a asPParser pop memoize.
	
	self denyMemoized: parser.
	self assert: parser warnings size equals: 1.