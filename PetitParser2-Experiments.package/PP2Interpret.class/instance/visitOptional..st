visiting
visitOptional: parser
	| retval memento |
	memento := currentContext remember.
	
	^ (retval := self visit: parser child) isPetit2Failure 
		ifTrue: [ currentContext restore: memento. nil ]
		ifFalse: [ retval ]