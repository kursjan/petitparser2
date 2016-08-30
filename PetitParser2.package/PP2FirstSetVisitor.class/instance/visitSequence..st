visiting
visitSequence: node
	| returnSet |
	(self isTerminal: node) ifTrue: [ ^ IdentitySet with: node ].
	
	returnSet := IdentitySet new.
	node children do: [ :child | 
		returnSet addAll: (self visit: child).
		child acceptsEpsilon ifFalse: [ ^ returnSet reject: [:e | e isEpsilon ] ]	
	].

	^ returnSet