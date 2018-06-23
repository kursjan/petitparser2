parsing
parseOn: context
	| memento retval |
	memento := self remember: context.
	retval := node child parseOn: context.
	
	self restore: context from: memento.
	^ retval isPetit2Failure 
		ifTrue: [ nil ]
		ifFalse: [ PP2Failure message: 'Child was not expected to pass' context: context  ]