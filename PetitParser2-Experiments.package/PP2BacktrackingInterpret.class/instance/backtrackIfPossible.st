visiting - helpers
backtrackIfPossible
	(currentContext continuationStack isEmpty) ifFalse: [  	
		| assoc |
		assoc := currentContext continuationStack pop.
		assoc key value: assoc value.
	]