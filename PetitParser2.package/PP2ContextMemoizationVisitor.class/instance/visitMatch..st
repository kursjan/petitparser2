visiting
visitMatch: node
	node child contextChanges isNotContextChange ifTrue: [ 
		node memoizationStrategy: PP2CFMemoization new
	].

	^ 	super visitWater: node
