visiting
visitNot: parser
	| retval memento |
	memento := currentContext remember.
	
	retval := self visit: parser child.
	currentContext restore: memento.
	
	^ retval isPetit2Failure 
		ifTrue: [ nil ]
		ifFalse: [ PP2Failure message: 'I was not expected to pass' context: currentContext ]