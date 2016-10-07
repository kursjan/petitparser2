as yet unclassified
parseOn: context
	| start retval |
	start := context position.
	retval := node child parseOn: context.
	(retval isPetit2Success and: [ context position = start ]) ifTrue: [ 
		^ PP2Failure message: 'epsilon parse not allowed' context: context
	].

	^ retval