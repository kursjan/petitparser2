parsing
parseOn: aPP2Context
	| literal |
	literal := node literal.
	
	^ (aPP2Context nextFor: literal)
		ifTrue: [ literal ]
		ifFalse: [ PP2Failure message: node message context: aPP2Context ]
		