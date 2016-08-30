visiting
visitOptional: node
	(self isTerminal: node) ifTrue: [ ^ IdentitySet with: node ].

	^ IdentitySet with: PP2EpsilonNode instance withAll: (self visit: node child)
