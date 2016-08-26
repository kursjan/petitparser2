visiting
visitEnd: parser
	self visit: parser child.
	currentContext atEnd 
		ifTrue: [ ^ currentContext ]
		ifFalse: [ ^ currentContext failure: 'end of input expected' ]