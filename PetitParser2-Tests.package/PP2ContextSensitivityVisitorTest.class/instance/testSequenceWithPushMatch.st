tests
testSequenceWithPushMatch
	parser := (#letter asPParser push), (#letter asPParser match).
	
	self denyIsContextSensitive: parser.