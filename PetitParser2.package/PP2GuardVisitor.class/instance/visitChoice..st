visiting
visitChoice: node
	| alternatives classification |
	super visitChoice: node.
	
	alternatives := node children.
	alternatives do: [ :alternative | 
		classification := self classificationFor: alternative.
		(self guardOf: classification makesSenseFor: alternative) ifTrue: [  
			alternative strategy: (alternative strategy choiceAlternativeGuard: classification)
		]
	].

