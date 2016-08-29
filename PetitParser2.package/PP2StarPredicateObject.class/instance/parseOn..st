parsing
parseOn: aPP2Context
	| collection |
	collection := OrderedCollection new.
	
	[aPP2Context atEnd not and: [ predicate value: aPP2Context uncheckedPeek ]] whileTrue: [  
		collection addLast: aPP2Context uncheckedNext
	].

	^ collection
	
