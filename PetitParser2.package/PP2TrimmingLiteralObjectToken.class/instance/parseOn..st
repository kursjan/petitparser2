as yet unclassified
parseOn: context
	| position retval |
	position := context position.
	node trimmer parseOn: context.
	
	(context nextFor: literal) ifTrue: [
		retval := context newToken: (node tokenClass) from: context position - 1
	] ifFalse: [  
		^ failure
	].
	
	node trimmer parseOn: context.

	^ retval