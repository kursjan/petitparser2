optimizations
doPass: node
	self visit: node.
	self changeStrategies: node	