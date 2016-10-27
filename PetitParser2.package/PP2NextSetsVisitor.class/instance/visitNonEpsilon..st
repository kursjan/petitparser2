visiting
visitNonEpsilon: node
	self addAll: currentNext to: node.
	self visitChildrenOf: node