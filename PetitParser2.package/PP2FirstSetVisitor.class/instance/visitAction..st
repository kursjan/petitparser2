visiting
visitAction: node
	(self isTerminal: node) ifTrue: [ ^ IdentitySet with: node ].

	^ self visit: node child 
