visiting
visitWater: node
	node waterToken contextChanges isContextChange ifFalse: [ 
		node memoizationStrategy: PP2CFMemoization new
	].

	^ 	super visitWater: node
