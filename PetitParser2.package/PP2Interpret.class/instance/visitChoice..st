visiting
visitChoice: parser
	| context |
	context := currentContext.
	
	1 to: parser parsers size do: [ :index |
		currentContext := context.
		(self visit: (parser childAt: index)) isPetitFailure ifFalse: [ ^ currentContext ] 
	].
	^ currentContext