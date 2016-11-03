visiting
visitFlatten: node
	node changesContext ifFalse: [ 
		node memoizationStrategy: PP2CFMemoization new
	].
	super visitFlatten: node.
	
