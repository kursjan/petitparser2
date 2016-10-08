parsing - adaptable
parseAdaptableWithContext: context
	| returnValue |
	context parser: self.
	self resetCaches.
	
	context startMemento: context remember.
	returnValue := self parseOn: context.

	^ returnValue isPetit2Success ifTrue: [ 
		context returnValue: returnValue 
	] ifFalse: [ 
		returnValue 
			parser: context parser;
			input: (context contents);
			yourself 
	]