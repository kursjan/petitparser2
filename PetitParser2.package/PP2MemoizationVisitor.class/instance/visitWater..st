visiting
visitWater: node
	super visitWater: node.
	
	node waterToken changesContext ifFalse: [ 
		node memoizationStrategy: PP2CFMemoization new
	]
