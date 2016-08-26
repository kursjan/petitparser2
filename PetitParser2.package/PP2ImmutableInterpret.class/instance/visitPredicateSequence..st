visiting
visitPredicateSequence: parser
	| context |
	context := currentContext next: parser size.
	
	^ (context value isNil not and: [ parser predicate value: context value]) 
		ifTrue: [ context ]
		ifFalse: [ currentContext failure: parser predicateMessage ]