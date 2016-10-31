visiting
visitPP2Node: node
	node shouldCache ifTrue: [ 
		self cache: node
	].
	super visitPP2Node: node