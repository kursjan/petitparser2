visiting
visitDelegate: node
	self addAll: currentNext to: node.
	self visitChildrenOf: node