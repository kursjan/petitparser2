visiting
visitAnd: parser
	| startContext |
	startContext := currentContext.
	^ (self visit: parser child) isPetit2Failure
		ifFalse: [ startContext success: currentContext value ]
		ifTrue: [ startContext failure: currentContext message ]