parsing
parseAdaptableWithContext: context
	| retval |
	retval := self parseOn: context.

	^ retval isPetit2Success 
		ifTrue: [ context retval: retval ]
		ifFalse: [ retval ]