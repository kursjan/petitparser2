visiting
visitTrimming: node
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	^ (self setWithPossible: node) 
		addAll: ((self visit: node trimmer) reject: [ :e | e isEpsilon ]);
		addAll: (self visit: node child);
		yourself