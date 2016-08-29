visiting
visitPP2Node: node
	self inToken ifTrue: [  
		"
			if a node has two or more parent, I don't know if the other parent is in token as well.
			Therefore, I rather skip this.
		"
		node parents size > 1 ifTrue: [  
			(node strategy recognizer ~= node strategy) ifTrue: [  
				node warnMultipleParents
			].
			^ self
		].
	
		node strategy: node strategy recognizer.
	].

	super visitPP2Node: node

