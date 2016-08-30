visiting
visitPossesiveRepeating: node
	(self isTerminal: node) ifTrue: [ ^ IdentitySet with: node ].
	
	^ (node min = 0) ifTrue: [ 
		IdentitySet with: PP2EpsilonNode instance withAll: (self visit: node child)
	] ifFalse: [  
		self visit: node child
	]