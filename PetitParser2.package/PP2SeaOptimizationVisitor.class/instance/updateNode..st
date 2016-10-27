seas optimizations
updateNode: node
	| nextSet |
	nextSet := self optimizedNextSet: node.
	
	node beforeWater boundary: (node boundaryFrom: (OrderedCollection with: node withAll: nextSet)).
	node afterWater boundary: (node boundaryFrom: (OrderedCollection withAll: nextSet)).
