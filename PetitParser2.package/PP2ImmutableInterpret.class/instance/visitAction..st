visiting
visitAction: parser
	^ (self visit: parser child) isPetit2Failure 
		ifTrue: [ ^ currentContext ]
		ifFalse: [ ^ currentContext success: (parser block value: currentContext value) ]