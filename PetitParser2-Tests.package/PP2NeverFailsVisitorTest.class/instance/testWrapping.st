tests
testWrapping
	parser := PP2AdaptableNode new.
	parser changeChild: $a asParser.

	self denyNeverFails: parser
