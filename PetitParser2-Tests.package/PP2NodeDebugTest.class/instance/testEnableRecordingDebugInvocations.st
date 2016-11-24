tests
testEnableRecordingDebugInvocations
	parser := PP2ExpressionGrammar new.
	parser optimize.
	
	parser enableDebug.
	parser enableRecording.
	
	self assert: parser allNodes allSatisfy: [ :n | n strategy isRecording ].