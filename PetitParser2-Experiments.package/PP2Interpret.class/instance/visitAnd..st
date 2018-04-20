visiting
visitAnd: parser
	| retval memento |
	memento := currentContext remember.
	
	retval := self visit: parser child. 
	currentContext restore: memento.
	
	^ retval isPetit2Success
		ifTrue: [ retval ]
		ifFalse: [ PP2Failure message: retval message context: currentContext ]
		