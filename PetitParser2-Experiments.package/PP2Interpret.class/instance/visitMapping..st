visiting
visitMapping: parser
	| retval |
	^ (retval := self visit: parser child) isPetit2Failure 
		ifTrue: [ ^ retval ]
		ifFalse: [ ^ parser block valueWithArguments: retval asOrderedCollection ]