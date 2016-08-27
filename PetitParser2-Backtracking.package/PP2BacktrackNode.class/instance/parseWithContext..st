parsing - private
parseWithContext: startContext
	| size returnContext |
	size := startContext continuationStack size.
	returnContext := parser parseWithContext: startContext.
	
	(returnContext isPetit2Failure and: [ returnContext continuationStack size > size]) ifTrue: [  	
		| assoc |
		assoc := returnContext continuationStack pop.
		assoc key value: assoc value.
	].

	^ returnContext