parsing
parseOn: aPP2Context
	| elements |
	
	(aPP2Context atEnd not and: [predicate value: aPP2Context uncheckedPeek]) ifFalse: [ 
		^ failure
	].

	elements := OrderedCollection with: aPP2Context uncheckedNext.
	
	[aPP2Context atEnd not and: [ predicate value: aPP2Context uncheckedPeek ]] whileTrue: [  
		elements addLast: aPP2Context uncheckedNext
	].

	^ elements
