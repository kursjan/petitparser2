visiting
visitSea: node
	node contextChanges isContextChange ifFalse: [ 
		node memoizationStrategy: PP2CFMemoization new
	].

	^ 	super visitSea: node
