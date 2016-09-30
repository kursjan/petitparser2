visiting
visitTrimming: node
	self addAll: currentNext to: node.
	self visit: node child