visiting
visitEndOfLine: node
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	self warn: 'I guess you have some issues with your terminal block.'