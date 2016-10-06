*PetitParser2-Seas
visitSea: node
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	^ (self setWithPossible: node) 
		addAll: (self visit: node beforeWater);
		addAll: (self visit: node island);
		addAll: (self visit: node afterWater);
		yourself