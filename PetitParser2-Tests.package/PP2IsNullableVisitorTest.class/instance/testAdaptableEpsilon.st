tests
testAdaptableEpsilon
	parser := PP2AdaptableNode new.
	parser changeChild: nil asParser2.

	self denyIsNullable: parser
