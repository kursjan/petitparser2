parsing
parseOn: aPP2Context
	| memento retval |
	memento := aPP2Context remember.
	retval := node child parseOn: aPP2Context.
	
	aPP2Context restore: memento.
	^ retval isPetit2Success 
		ifTrue: [ retval ]
		ifFalse: [ PP2Failure message: retval message context: aPP2Context  ]