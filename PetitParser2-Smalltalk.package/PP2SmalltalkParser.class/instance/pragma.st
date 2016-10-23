grammar
pragma
	^ super pragma
		==> [ :nodes | 
			(RBPragmaNode
				selector: (self buildSelector: nodes second first)
				keywordsPositions: (nodes second first collect: [ :each | each start ])
				arguments: nodes second second)
				pp2AddComments: nodes first comments;
				pp2AddComments: nodes last comments;
				left: nodes first start;
				right: nodes last start;
				yourself ]