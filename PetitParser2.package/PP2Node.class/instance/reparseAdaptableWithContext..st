parsing - adaptable
reparseAdaptableWithContext: context
	| returnValue |
	[
		context reset.
		context parser ifNil: [ context parser: self ] ifNotNil: [ self assert: context parser == self ].
		context restore: context startMemento.
		
		returnValue := self parseOn: context.

		self checkPromises.

		^ returnValue isPetit2Success ifTrue: [ 
			context returnValue: returnValue 
		] ifFalse: [ 
			returnValue 
				parser: context parser;
				input: (context contents);
				yourself 
		]
	] on: PP2ReparseException do: [ 
		"reparse did not worked, do the full parse instead"
		context reset.
		context restore: context startMemento.	
		^ self parseAdaptableWithContext: context
	]