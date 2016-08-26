grammar
methodDeclaration
	^ super methodDeclaration
		==> [ :nodes | 
			RBMethodNode
				selector: (self buildSelector: nodes first)
				keywordsPositions: (nodes first collect: [ :each | each start ])
				arguments: nodes second ]