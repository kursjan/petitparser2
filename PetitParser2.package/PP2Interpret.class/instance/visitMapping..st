visiting
visitMapping: parser
	^ (self visit: parser child) isPetit2Failure 
		ifTrue: [ ^ currentContext ]
		ifFalse: [ ^ currentContext success: (parser block valueWithArguments: currentContext value asOrderedCollection) ]