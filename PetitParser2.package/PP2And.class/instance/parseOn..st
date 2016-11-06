parsing
parseOn: context
	| memento retval |
	memento := self remember: context.
	retval := node child parseOn: context.
	self restore: context from: memento. 
	
	^ retval isPetit2Success 
		ifTrue: [	retval ]
		ifFalse: [ PP2Failure message: retval message context: context  ]