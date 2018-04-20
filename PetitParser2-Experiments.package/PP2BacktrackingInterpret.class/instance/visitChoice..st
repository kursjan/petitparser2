visiting
visitChoice: parser
	| retval |
	1 to: parser children size do: [ :index |
		"Before each child fails, do backtracking:"
		(retval := self backtrackingVisit: (parser childAt: index)) isPetit2Failure 
			ifFalse: [ ^ retval ] 
	].
	^ retval