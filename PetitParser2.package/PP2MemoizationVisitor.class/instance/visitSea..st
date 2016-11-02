visiting
visitSea: node
	super visitSea: node.
	
	node changesContext ifFalse: [ 
		node memoizationStrategy: PP2CFMemoization new
	]
