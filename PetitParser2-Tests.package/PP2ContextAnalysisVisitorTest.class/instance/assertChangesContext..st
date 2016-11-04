asserting
assertChangesContext: node
	self assert: (visitor visit: node) isContextChange