tests
testAdaptable
	parser := PP2AdaptableNode new.
	parser changeChild: $a asPParser.

	self denyIsNullable: parser
