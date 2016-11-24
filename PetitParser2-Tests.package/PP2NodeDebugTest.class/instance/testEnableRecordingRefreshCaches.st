tests
testEnableRecordingRefreshCaches
	parser := PP2ExpressionGrammar new.
	parser optimize.
	
	parser enableRecording.
	
	self deny: parser collectCaches isEmpty.
	self assert: parser allCaches equals: parser collectCaches.