visiting - utilities
nodeOpened: node
	self assert: parent isNil not.
	
	node addParent: parent