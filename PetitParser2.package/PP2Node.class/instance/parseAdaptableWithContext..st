parsing
parseAdaptableWithContext: context
	| retval |
	context parser: self.
	
	retval := self parseOn: context.

	^ retval isPetit2Success ifTrue: [ 
		context retval: retval 
	] ifFalse: [ 
		retval 
			root: context parser;
			input: (context asPositionableStream);
			yourself 
	]