visiting
visitPossesiveRepeating: node
	| oldNext |
	self addAll: currentNext to: node.
	oldNext := currentNext.
	currentNext := IdentitySet with: node.
	currentNext addAll: oldNext.
	
	self visitChildrenOf: node.
	
	currentNext := oldNext