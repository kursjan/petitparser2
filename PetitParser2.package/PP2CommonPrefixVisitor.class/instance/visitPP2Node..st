visiting
visitPP2Node: node
	node shouldCache ifTrue: [ 
		node strategy: node strategy cache.
	].
	super visitPP2Node: node