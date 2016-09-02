visiting
visitPossesiveRepeating: node
	| classification |
	super visitPossesiveRepeating: node.
"	
	classification := self classificationFor: node child.
	(self guardOf: classification makesSenseFor: node child) ifTrue: [  
		node child strategy: (node child strategy choiceAlternativeGuard: classification)
	]
"