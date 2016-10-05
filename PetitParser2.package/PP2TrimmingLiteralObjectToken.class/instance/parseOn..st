as yet unclassified
parseOn: context
	| position retval |
	position := context position.
	trimmer parseOn: context.
	
	(context nextFor: literal) ifTrue: [
		retval := context newToken: tokenClass from: context position - 1
	] ifFalse: [  
		^ failure
	].
	
	trimmer parseOn: context.

	^ retval