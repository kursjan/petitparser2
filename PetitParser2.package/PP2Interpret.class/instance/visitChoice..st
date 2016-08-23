visiting
visitChoice: parser
	| startContext |
	startContext := currentContext.
	
	1 to: parser parsers size do: [ :index |
		currentContext := startContext.
		(self visit: (parser childAt: index)) isPetitFailure ifFalse: [ ^ currentContext ] 
	].
	^ currentContext