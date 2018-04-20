parsing - private
parseOn: startContext
	| size returnContext |
	size := startContext continuationStack size.
	returnContext := child parseWithContext: startContext.
	
	(returnContext isPetit2Failure and: [ returnContext continuationStack size > size]) ifTrue: [  	
		| assoc |
		assoc := returnContext continuationStack pop.
		assoc key value: assoc value.
	].

	^ returnContext