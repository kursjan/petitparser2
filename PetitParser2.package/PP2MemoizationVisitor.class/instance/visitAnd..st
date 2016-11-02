visiting
visitAnd: node
	super visitAnd: node.
	
	node child changesContext ifFalse: [ 
		node memoizationStrategy: PP2CFMemoization new
	]
