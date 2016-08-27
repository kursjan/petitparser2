parsing
parseOn: aPP2Context
	| memento retval |
	memento := aPP2Context remember.
	retval := node child parseOn: aPP2Context.
	
	aPP2Context restore: memento.
	^ retval isPetit2Failure 
		ifTrue: [ nil ]
		ifFalse: [ PP2Failure message: 'Child was not expected to pass' context: aPP2Context  ]