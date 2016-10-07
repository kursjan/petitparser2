visiting
visitPossesiveRepeating: node
	| oldNext |
	self addAll: currentNext to: node.
	oldNext := currentNext.
	currentNext := OrderedCollection with: node withAll: oldNext.
	
	self visitChildrenOf: node.
	
	currentNext := oldNext