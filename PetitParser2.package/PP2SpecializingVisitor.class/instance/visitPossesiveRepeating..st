visiting
visitPossesiveRepeating: node
	(self isStar: node) ifTrue: [  
		node strategy: (PP2Star on: node)
	].

	(self isStarPredicateObject: node) ifTrue: [  
		node strategy: (PP2StarPredicateObject 
			on: node 
			predicate: node child predicate)
	].

	(self isPlus: node) ifTrue: [  
		node strategy: (PP2Plus on: node)
	].

	(self isPlusPredicateObject: node) ifTrue: [  
		node strategy: (PP2PlusPredicateObject on: node)
	].

	^ super visitPossesiveRepeating: node
