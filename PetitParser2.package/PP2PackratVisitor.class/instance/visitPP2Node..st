as yet unclassified
visitPP2Node: node
	node shouldMemoize ifTrue: [  
		node strategy: node strategy memoize
	].
	^ super visitPP2Node: node
