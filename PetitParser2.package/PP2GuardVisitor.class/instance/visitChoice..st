visiting
visitChoice: node
	| alternatives classification |

	alternatives := node children.

	alternatives do: [ :alternative | 
		classification := self classificationFor: alternative.
		(self guardOf: classification makesSenseFor: alternative) ifTrue: [  
			alternative strategy: (alternative strategy choiceAlternativeGuard: classification).
			self visit: alternative guardedWith: classification
		] ifFalse: [  
			self visit: alternative
		]
	].

