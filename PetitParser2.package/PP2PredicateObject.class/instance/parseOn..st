parsing
parseOn: aPP2Context
	^ (aPP2Context atEnd not and: [ node predicate value: aPP2Context uncheckedPeek ])
		ifFalse: [ PP2Failure message: node predicateMessage context: aPP2Context  ]
		ifTrue: [ aPP2Context uncheckedNext ]