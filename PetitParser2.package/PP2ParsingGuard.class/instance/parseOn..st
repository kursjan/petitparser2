parsing
parseOn: context
	| intValue |
	context atEnd ifTrue: [ ^ retval ].

	intValue := context uncheckedPeek asInteger.
	(intValue > 0 and: [intValue < 128 and: [classification at: intValue]]) ifFalse: [ 
		^ retval
	].
	^ super parseOn: context