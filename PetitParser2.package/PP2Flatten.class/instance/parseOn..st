parsing
parseOn: aPP2Context
	| retval start |
	start := aPP2Context position.

	^ (retval := node child parseOn: aPP2Context) isPetit2Success ifTrue: [ 
		aPP2Context copyFrom: start + 1 to: aPP2Context position
	] ifFalse: [ 
		retval
	]