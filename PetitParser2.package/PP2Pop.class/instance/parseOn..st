as yet unclassified
parseOn: context
	| retval |
	retval := node child parseOn: context.
	
	retval isPetit2Failure ifFalse: [  
		(context stackNamed: node stackId) pop
	].

	^ retval