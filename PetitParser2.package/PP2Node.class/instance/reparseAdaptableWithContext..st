parsing - adaptable
reparseAdaptableWithContext: context
	| returnValue |
	context parser isNil ifTrue: [ context parser: self ] ifFalse: [ self assert: context parser == self ].
	context restore: context startMemento.
	returnValue := self parseOn: context.

	^ returnValue isPetit2Success ifTrue: [ 
		context returnValue: returnValue 
	] ifFalse: [ 
		returnValue 
			parser: context parser;
			input: (context contents);
			yourself 
	]