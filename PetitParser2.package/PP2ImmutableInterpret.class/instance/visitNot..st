visiting
visitNot: parser
	| startContext |
	startContext := currentContext.
	^ (self visit: parser child) isPetit2Failure 
		ifTrue: [ startContext success: nil ]
		ifFalse: [ startContext failure: 'I was not expected to pass' ]