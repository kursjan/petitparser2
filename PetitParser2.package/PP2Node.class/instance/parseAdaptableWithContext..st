parsing
parseAdaptableWithContext: context
	| retval |
	context parser: self.
	self allCaches do: [ :cache | cache reset ].
	
	retval := self parseOn: context.

	^ retval isPetit2Success ifTrue: [ 
		context retval: retval 
	] ifFalse: [ 
		retval 
			root: context parser;
			input: (context asPositionableStream);
			yourself 
	]