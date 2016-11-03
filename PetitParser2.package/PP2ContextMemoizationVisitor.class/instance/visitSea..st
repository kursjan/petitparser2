visiting
visitSea: node
	node changesContext ifFalse: [ 
		node memoizationStrategy: PP2CFMemoization new
	].

	^ 	super visitSea: node
