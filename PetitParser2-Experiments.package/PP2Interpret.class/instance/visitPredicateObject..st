visiting
visitPredicateObject: parser
	^ (currentContext atEnd not and: [ parser predicate value: currentContext uncheckedPeek ])
		ifFalse: [ PP2Failure message: parser predicateMessage context: currentContext  ]
		ifTrue: [ currentContext uncheckedNext ]