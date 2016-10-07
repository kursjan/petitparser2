visiting
visitFragment: parser
	| start retval |
	start := currentContext position.
	(retval := self visit: parser child) isPetit2Failure ifTrue: [ ^ retval ].

	^ PP2Fragment new
		parsedValue: retval;
		start: start;
		stop: currentContext position;
		yourself