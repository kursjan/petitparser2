visiting
visitAction: parser
	| retval |
	^ (retval := self visit: parser child) isPetit2Failure 
		ifTrue: [ ^ retval ]
		ifFalse: [ ^ parser block value: retval ]