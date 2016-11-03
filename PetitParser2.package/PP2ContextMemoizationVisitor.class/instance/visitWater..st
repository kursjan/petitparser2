visiting
visitWater: node
	node waterToken changesContext ifFalse: [ 
		node memoizationStrategy: PP2CFMemoization new
	].

	^ 	super visitWater: node
