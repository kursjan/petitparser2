visiting
visitAnd: node
	node child contextChanges isContextChange ifFalse: [ 
		node memoizationStrategy: PP2CFMemoization new
	].

	^ 	super visitAnd: node.
