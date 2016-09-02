*PetitParser2-Smalltalk
visitSmalltalkWhitespace: node
	| returnSet |
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	returnSet := self setWithPossible: node.
	
	returnSet addAll: (self visit: #space asParser2).
	returnSet addAll: (self visit: $" asParser2).
	
	^ returnSet