visiting
visitSequence: node
	| returnSet |
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	returnSet := self setWithPossible: node.
	node children do: [ :child | 
		returnSet addAll: (self visit: child).
		child isNullable ifFalse: [ ^ returnSet reject: [ :e | e isEpsilon ] ]
	].

	self addIfPossible: PP2EpsilonNode instance to: returnSet.
	^ returnSet