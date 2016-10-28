as yet unclassified
parseOn: context
	| position retval |
	position := context rememberPosition.
	trimmer parseOn: context.
	
	(context nextFor: literal) ifTrue: [
		retval := context newToken: tokenClass from: context position - 1
	] ifFalse: [  
		context restorePosition: position.
		^ failure
	].
	
	trimmer parseOn: context.

	^ retval