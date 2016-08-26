visiting
visitEnd: parser
	| memento retval |
	
	memento := currentContext remember.
	retval := self visit: parser child.

	^ currentContext atEnd 
		ifTrue: [ retval ] 
		ifFalse: [ 
			retval := PP2Failure message: 'end of input expected' context: currentContext.
			currentContext restore: memento.
			^ retval
		]