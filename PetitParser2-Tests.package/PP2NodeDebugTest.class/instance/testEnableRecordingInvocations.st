tests
testEnableRecordingInvocations
	parser := PP2ExpressionGrammar new.
	parser optimize.
	
	parser enableRecording.
	
	self flag: 'JK: Does not work right now, should implement?'
"	self assert: parser allNodes allSatisfy: [ :n | n strategy isRecording ]."