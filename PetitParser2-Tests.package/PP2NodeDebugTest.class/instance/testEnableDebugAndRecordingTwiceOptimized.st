tests
testEnableDebugAndRecordingTwiceOptimized
	| strategies |
	parser := PP2ExpressionGrammar new.

	parser optimize.
	parser enableDebug.
	parser enableRecording.
	
	strategies := IdentityDictionary new.
	parser allNodesDo: [ :node | strategies at: node put: node strategies ].
	
	parser enableDebug.
	parser enableRecording.
	
	parser allNodesDo: [ :node | 
		self assert: (strategies at: node) equals: node strategies.
	]