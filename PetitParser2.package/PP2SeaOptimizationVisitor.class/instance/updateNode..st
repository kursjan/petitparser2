seas optimizations
updateNode: node
	| nextSet |
	nextSet := self optimizedNextSet: node.
	
	node beforeWater boundaryElements: (OrderedCollection with: node island withAll: nextSet).
	node afterWater boundaryElements: (OrderedCollection withAll: nextSet).
	node root: rootNode.