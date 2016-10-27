seas optimizations
createAfterWater: node
	| nextSet |
	self halt: 'depr.'.
	nextSet := self optimizedNextSet: node.

	^ (PP2WaterNode new)
		waterToken: node waterToken;
		boundary: (node boundaryFrom: (OrderedCollection withAll: nextSet)).