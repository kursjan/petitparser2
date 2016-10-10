visiting
visitPP2Node: node
	(self shouldMemoize: node) ifTrue: [  
		node strategy: node strategy reparsable
	].
	
	^ super visitPP2Node: node