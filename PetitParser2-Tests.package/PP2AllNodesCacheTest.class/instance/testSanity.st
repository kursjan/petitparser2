tests
testSanity
	| parser |
	parser := PP2ExpressionGrammar new.
	PP2AllNodesCache new doPass: parser.
	
	parser allNodesDo: [ :child | 
		self assert: (child hasProperty: #allNodesSize).
	].

	self assert: (parser productionAt: #number) hasProperty: #allNodesSize withValue: 12.
	self assert: parser hasProperty: #allNodesSize withValue: parser allNodes size.	