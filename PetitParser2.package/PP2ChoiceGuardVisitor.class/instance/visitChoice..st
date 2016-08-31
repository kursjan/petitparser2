visiting
visitChoice: node
	| alternatives classification strategy |
	alternatives := node children.
	
	alternatives do: [ :alternative | 
		classification := self classificationFor: alternative.
		(self guardOf: classification makesSenseFor: alternative) ifTrue: [  
			strategy := (PP2ChoiceAlternativeGuard on: alternative strategy).
			strategy classification: classification.
			alternative strategy: strategy
		]
	].

