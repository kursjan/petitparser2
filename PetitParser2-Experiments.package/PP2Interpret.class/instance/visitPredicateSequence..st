visiting
visitPredicateSequence: parser
	| retval position |
	position := currentContext position.
	retval := currentContext next: parser size.
	
	^ (retval isNil not and: [ parser predicate value: retval ]) 
		ifTrue: [ retval ]
		ifFalse: [ 
			currentContext position: position.
			PP2Failure message: parser predicateMessage context: currentContext 
		]