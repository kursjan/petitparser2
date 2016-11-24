tests
testEnableDebugAndRecordingTwice
	parser := PP2ExpressionGrammar new.
	parser enableDebug.
	parser enableRecording.
	parser enableDebug.
	parser enableRecording.
	
	self assert: parser allNodes allSatisfy: [ :node | node strategies size = 2 ].
	self assert: parser allNodes allSatisfy: [ :node |  node strategies first isDebugging ].
	self assert: parser allNodes allSatisfy: [ :node |  node strategies first isRecording ].
	self assert: parser allNodes noneSatisfy: [ :node |  node strategies second isDebugging ]	.