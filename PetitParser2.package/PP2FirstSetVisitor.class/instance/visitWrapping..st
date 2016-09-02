visiting
visitWrapping: node
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].
	"	
		Be conservative, we don't what is happening inside the block, 
		so the whole block serves as a first set terminal.
	"

	^ self setWithPossible: node withAll: (self visit: node child) 