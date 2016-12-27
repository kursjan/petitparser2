tests
testIsAny
	parser := #any asPParser.
	
	self assert: (visitor isAny: parser).