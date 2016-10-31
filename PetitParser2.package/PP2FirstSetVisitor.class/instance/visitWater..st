visiting
visitWater: node
	| retval lrStatus |
	(self isTerminal: node) ifTrue: [ ^ self setWithPossible: node ].

	lrStatus := leftRecursionAllowed.
	leftRecursionAllowed := true.

	retval := (self setWithPossible: node) 
		addAll: (self visit: node waterToken);
		addAll: (self visit: node boundary);
		yourself.
		
	leftRecursionAllowed := lrStatus.	
		
	^ retval