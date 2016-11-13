visiting
visitPP2Node: node
	(node shouldMemoize) ifTrue: [  
		(node contextChanges isContextChange) ifTrue: [  
			node addWarning: 'cannot memoize a node that changes context!'
		] ifFalse: [ 
			node strategy: node strategy memoize
		]
	].
	^ super visitPP2Node: node
