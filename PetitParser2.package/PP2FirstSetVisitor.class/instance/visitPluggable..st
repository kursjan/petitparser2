visiting
visitPluggable: node
	(self isTerminal: node) ifTrue: [ ^ IdentitySet with: node ].

	^ IdentitySet with: node