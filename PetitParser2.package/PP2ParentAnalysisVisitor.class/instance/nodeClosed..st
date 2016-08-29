visiting - utilities
nodeClosed: node
	self assert: parent isNil not.
	
	node addParent: parent