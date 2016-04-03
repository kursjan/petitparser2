visiting - helpers
backtrackingVisit: parser
	"visit parser, if it fails, try to backtrack (if the parser created any continuations)"
	| size |
	size := currentContext continuationStack size.
	self visit: parser.
	
	(currentContext isPetit2Failure and: [ currentContext continuationStack size > size ]) 
		ifTrue: [ self backtrackIfPossible ].
		
	^ currentContext