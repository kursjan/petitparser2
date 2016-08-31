visiting
visitSequence: node
	| returnSet |
	(self isTerminal: node) ifTrue: [ ^ IdentitySet with: node ].
	
	returnSet := IdentitySet new.
	node children do: [ :child | 
		returnSet addAll: (self visit: child).
		returnSet detect: [ :e | e isEpsilon ] 
			ifFound: [ :eps | returnSet remove: eps  ]	
			ifNone: [ ^ returnSet ]
	].

	returnSet add: PP2EpsilonNode instance.
	^ returnSet