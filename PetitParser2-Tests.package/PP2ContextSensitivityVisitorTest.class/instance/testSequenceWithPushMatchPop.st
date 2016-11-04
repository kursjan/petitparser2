tests
testSequenceWithPushMatchPop
	parser := (#letter asPParser push), (#letter asPParser match), (#letter asPParser pop).
	
	self denyIsContextSensitive: parser.