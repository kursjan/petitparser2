parsing
parseOn: aPP2Context
	| retval position |
	position := aPP2Context position.
	retval := aPP2Context next: node size.
	
	^ (retval isNil not and: [ node predicate value: retval ]) 
		ifTrue: [ retval ]
		ifFalse: [ 
			aPP2Context position: position.
			PP2Failure message: node predicateMessage context: aPP2Context 
		]