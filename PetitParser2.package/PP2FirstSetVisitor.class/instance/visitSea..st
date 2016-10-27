visiting
visitSea: node
	| returnSet |
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	returnSet := (self setWithPossible: node).
	returnSet addAll: (self visit: node beforeWater).
	returnSet removeAllSuchThat: [ :e | e = #eoi asPParser ].
	returnSet addAll: (self visit: node island).
	node island isNullable ifTrue: [ 
		returnSet addAll: (self visit: node afterWater).
	].
		
	^ returnSet reject: [ :e | e isEpsilon ] 