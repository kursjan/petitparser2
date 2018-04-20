visiting
visitBacktrackingChoice: parser
	| continuation index memento |
	memento := currentContext remember.
	index := Continuation currentDo: [ :cc | continuation := cc. 1 ].
	"
	 A bit of magic here, but currentContext is instance variable and is not 
	 persistend when a continuation is created, therefore it should be restored 
	 from a stack variable.
	"
	currentContext restore: memento.

	^ (index <= parser children size) ifTrue: [ 
		currentContext continuationStack push: (continuation -> (index + 1)).
		self visit: (parser childAt: index) .
	] ifFalse: [ 
		PP2Failure message: 'no suitable choice found' context: currentContext
	]
