visiting
visitPredicateObject: node
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	self warn: 'guess you have some issues with your terminal block'