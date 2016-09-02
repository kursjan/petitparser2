visiting
visitFlatten: node
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	^ self setWithPossible: node withAll: (self visit: node child) 
