parsing
parseOn: context
	| retval |
	retval := (node child parseOn: context).
	retval isPetit2Failure ifTrue: [ ^ retval ].
	
	(context stackNamed: node stackId) push: retval.
	^ retval