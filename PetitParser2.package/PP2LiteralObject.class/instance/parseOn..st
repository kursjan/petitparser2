parsing
parseOn: aPP2Context
	| literal |
	literal := node literal.
	
	^ (aPP2Context peekFor: literal)
		ifTrue: [ literal ]
		ifFalse: [ PP2Failure message: node message context: aPP2Context ]
		