visiting - helpers
backtrackingVisit: parser
	"visit parser, if it fails, try to backtrack (if the parser created any continuations)"
	| size retval |
	size := currentContext continuationStack size.
	retval := self visit: parser.
	
	(retval isPetit2Failure and: [ currentContext continuationStack size > size ]) 
		ifTrue: [ self backtrackIfPossible ].
		
	^ retval