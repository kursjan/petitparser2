visiting
visitNonEpsilon: node
	| set |
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	set := (self setWithPossible: node).
	set addAll: (self visit: node child).
	set remove: PP2EpsilonNode instance ifAbsent: nil.
	
	^ set