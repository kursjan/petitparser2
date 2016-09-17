tests
testAdaptableEpsilon
	parser := PP2AdaptableNode new.
	parser changeChild: nil asPParser.

	self denyIsNullable: parser
