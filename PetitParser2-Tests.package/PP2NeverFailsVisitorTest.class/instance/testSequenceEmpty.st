tests
testSequenceEmpty
	self assertNeverFails: #letter asParser2 optional, nil asParser2
