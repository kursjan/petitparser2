visiting
visitChoice: parser
	| startContext |
	startContext := currentContext.
	
	1 to: parser children size do: [ :index |
		currentContext := startContext.
		(self visit: (parser childAt: index)) isPetit2Failure ifFalse: [ ^ currentContext ] 
	].
	^ currentContext