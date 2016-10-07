visiting
visitWater: node
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	^ (self setWithPossible: node) 
		addAll: (self visit: node waterToken);
		addAll: (self visit: node boundary);
		yourself