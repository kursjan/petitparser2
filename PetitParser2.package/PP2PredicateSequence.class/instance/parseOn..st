parsing
parseOn: aPP2Context
	| retval position |
	position := aPP2Context rememberPosition.
	retval := aPP2Context next: node size.
	
	^ (retval isNil not and: [ node predicate value: retval ]) 
		ifTrue: [ retval ]
		ifFalse: [ 
			aPP2Context restorePosition: position.
			PP2Failure message: node predicateMessage context: aPP2Context 
		]