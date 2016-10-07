visiting
visitFragment: parser
	| start retval |
	start := currentContext remember.
	(retval := self visit: parser child) isPetit2Failure ifTrue: [ ^ retval ].

	^ currentContext copy 
		returnValue: retval;
		startMemento: start;
		parser: parser;
		yourself