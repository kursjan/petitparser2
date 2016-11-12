as yet unclassified
parseOn: context
	| start memento retval |
	memento := self remember: context.
	start := context position.
	retval := node child parseOn: context.
	(retval isPetit2Success and: [ context position = start ]) ifTrue: [ 
		self restore: context from: memento.
		^ PP2Failure message: 'epsilon parse not allowed' context: context
	].

	^ retval