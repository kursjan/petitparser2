parsing
parseWithContext: startContext
	| retval |
	currentContext := startContext.
	retval := self visit: rootParser.
	
	^ retval isPetit2Failure ifTrue: [ retval ] ifFalse: [ currentContext returnValue: retval; yourself ]
		