visiting
visitFlatten: node
	node contextChanges isContextChange ifFalse: [ 
		node memoizationStrategy: PP2CFMemoization new
	].
	super visitFlatten: node.
	
