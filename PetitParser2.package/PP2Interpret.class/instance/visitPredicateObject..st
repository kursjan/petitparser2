visiting
visitPredicateObject: parser
	^ (currentContext atEnd not and: [ parser predicate value: currentContext uncheckedPeek ])
		ifFalse: [ currentContext failure: parser predicateMessage  ]
		ifTrue: [ currentContext uncheckedNext ]