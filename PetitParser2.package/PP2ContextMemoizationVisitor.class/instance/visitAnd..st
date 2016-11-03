visiting
visitAnd: node
	node child changesContext ifFalse: [ 
		node memoizationStrategy: PP2CFMemoization new
	].

	^ 	super visitAnd: node.
