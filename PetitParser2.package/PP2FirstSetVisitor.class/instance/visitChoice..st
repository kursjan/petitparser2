visiting
visitChoice: node
	| returnSet |
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].
	
	returnSet := self setWithPossible: node.
	node children do: [ :child | 
		returnSet addAll: (self visit: child).
	].

	^ returnSet