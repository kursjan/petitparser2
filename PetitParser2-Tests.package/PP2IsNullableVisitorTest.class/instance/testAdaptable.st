tests
testAdaptable
	parser := PP2AdaptableNode new.
	parser changeChild: $a asParser2.

	self denyIsNullable: parser
