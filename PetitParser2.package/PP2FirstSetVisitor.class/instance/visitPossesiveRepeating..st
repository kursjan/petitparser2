visiting
visitPossesiveRepeating: node
	| set |
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	set := self setWithPossible: node withAll: (self visit: node child).

	(node min = 0) ifTrue: [ 
		self addIfPossible: PP2EpsilonNode instance to: set.
	].

	^ set