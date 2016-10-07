seas optimizations
createAfterWater: node
	| nextSet |
	nextSet := self optimizedNextSet: node.
	
	^ (PP2WaterNode new)
		waterToken: node waterToken;
		boundary: (node boundaryFrom: (OrderedCollection withAll: nextSet)).