visiting
visitOptional: parser
	| context |
	context := currentContext.
	^ (self visit: parser child) isPetit2Failure 
		ifTrue: [ context success: nil ]
		ifFalse: [ currentContext ]