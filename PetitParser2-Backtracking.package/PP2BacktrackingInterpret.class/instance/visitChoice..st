visiting
visitChoice: parser
	| startContext |
	startContext := currentContext.
	
	1 to: parser parsers size do: [ :index |
		currentContext := startContext.
		"Before each child fails, do backtracking:"
		(self backtrackingVisit: (parser childAt: index)) isPetit2Failure 
			ifFalse: [ ^ currentContext ] 
	].
	^ currentContext