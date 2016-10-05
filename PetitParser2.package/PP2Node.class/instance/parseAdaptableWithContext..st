parsing - adaptable
parseAdaptableWithContext: context
	| retval |
	context parser: self.
	self resetCaches.
	
	retval := self parseOn: context.

	^ retval isPetit2Success ifTrue: [ 
		context retval: retval 
	] ifFalse: [ 
		retval 
			root: context parser;
			input: (context contents);
			yourself 
	]