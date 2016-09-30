visiting
visitChildrenOf: node
	node children do: [ :child | self visit: child ]