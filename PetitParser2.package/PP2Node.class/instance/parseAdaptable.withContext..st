parsing
parseAdaptable: input withContext: context
	| retval |
	
	context stream: input asPetit2Stream.
	context position: 0.
	context parser: self.
	
	retval := self parseOn: context.

	^ retval isPetit2Success 
		ifTrue: [ context retval: retval ]
		ifFalse: [ retval ]