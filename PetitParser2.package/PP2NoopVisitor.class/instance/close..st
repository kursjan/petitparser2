visiting - utilities
close: node
	self assert: (self isOpened: node).
	self assert: ((self shouldRevisit: node) or: [(self isClosed: node) not]).
	self assert: (openStack top == node).
	
	openSet remove: node.
	openStack pop.
	closeSet add: node.