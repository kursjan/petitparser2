tests
testEnableDebugTwice
	parser := PP2ExpressionGrammar new.
	parser enableDebug.
	parser enableDebug.
	
	self assert: parser allNodes allSatisfy: [ :node | node strategies size = 2 ].
	self assert: parser allNodes allSatisfy: [ :node |  node strategies first isDebugging ].
	self assert: parser allNodes noneSatisfy: [ :node |  node strategies second isDebugging ]	