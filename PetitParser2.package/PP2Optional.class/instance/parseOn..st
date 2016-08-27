parsing
parseOn: aPP2Context
	| memento retval |
	memento := aPP2Context remember.
	
	^ (retval := node child parseOn: aPP2Context) isPetit2Success
		ifTrue: [ retval ]
		ifFalse: [ aPP2Context restore: memento. nil ]
