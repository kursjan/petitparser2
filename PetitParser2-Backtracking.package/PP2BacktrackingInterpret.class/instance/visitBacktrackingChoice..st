visiting
visitBacktrackingChoice: parser
	| startContext continuation index |
	startContext := currentContext.

	index := Continuation currentDo: [ :cc | continuation := cc. 1 ].
	"
	 A bit of magic here, but currentContext is instance variable and is not 
	 persistend when a continuation is created, therefore it should be restored 
	 from a stack variable.
	"
	currentContext := startContext.

	^ (index <= parser children size) ifTrue: [ 
		currentContext continuationStack push: (continuation -> (index + 1)).
		self visit: (parser childAt: index) .
	] ifFalse: [ 
		currentContext failure: 'no suitable choice found'
	].
