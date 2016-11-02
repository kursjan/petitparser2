visiting
visitFlatten: node
	super visitFlatten: node.
	
	node changesContext ifFalse: [ 
		node memoizationStrategy: PP2CFMemoization new
	]
