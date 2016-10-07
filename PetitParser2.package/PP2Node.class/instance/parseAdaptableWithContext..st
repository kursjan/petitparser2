parsing - adaptable
parseAdaptableWithContext: context
	| retval |
	context parser: self.
	self resetCaches.
	
	retval := self parseOn: context.

	^ retval isPetit2Success ifTrue: [ 
		context returnValue: retval 
	] ifFalse: [ 
		retval 
			parser: context parser;
			input: (context contents);
			yourself 
	]