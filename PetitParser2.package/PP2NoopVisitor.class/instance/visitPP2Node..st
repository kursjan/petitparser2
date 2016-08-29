visiting
visitPP2Node: node
	node children do: [ :child | self visit: child ]	