tests
testEnableRecordingCaches
	parser := PP2ExpressionGrammar new.
	parser optimize.
	
	parser enableRecording.
	
	self deny: parser collectCaches isEmpty.
	self assert: parser collectCaches allSatisfy: [ :c | c isRecording ].