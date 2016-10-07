parsing
parseOn: context
	| start retval |
	start := context position.
	(retval := node child parseOn: context) isPetit2Failure ifTrue: [ ^ retval ].

	^ PP2Fragment new 
		parsedValue: retval;
		start: start;
		stop: context position;
		parser: self;
		stream: context stream;
		yourself