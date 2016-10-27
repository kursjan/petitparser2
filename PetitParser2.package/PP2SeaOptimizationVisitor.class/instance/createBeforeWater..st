seas optimizations
createBeforeWater: node
	| nextSet |
	self halt: 'depr.'.
	
	nextSet := self nextSet: node.
	nextSet := self removeSeas: nextSet.
	
	^ (PP2WaterNode new)
		waterToken: node waterToken;
		boundary: (node boundaryFrom: (OrderedCollection with: node island withAll: nextSet)).