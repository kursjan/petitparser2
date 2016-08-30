visiting
visitTrimmingToken: node
	(self isTerminal: node) ifTrue: [ ^ IdentitySet with: node ].

	^ IdentitySet new 
		addAll: ((self visit: node trimmer) reject: [ :e | e isEpsilon ]);
		addAll: (self visit: node child);
		yourself