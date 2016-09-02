visiting
visitOptional: node
	| set |
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	set := (self setWithPossible: node).
	set addAll: (self visit: node child).
	self addIfPossible: PP2EpsilonNode instance to: set.
	
	^ set