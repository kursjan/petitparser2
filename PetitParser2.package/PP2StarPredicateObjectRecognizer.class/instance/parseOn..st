as yet unclassified
parseOn: aPP2Context
	[aPP2Context atEnd not and: [ predicate value: aPP2Context uncheckedPeek ]] whileTrue: [  
		aPP2Context shift
	].

	^ #()
	
