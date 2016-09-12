visiting - utilities
open: node
	self assert: (self isOpened: node) not.
	openSet add: node.
	openStack push: node