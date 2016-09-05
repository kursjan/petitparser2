parsing
parseOn: context
	| intValue |
	context atEnd ifTrue: [ ^ failure ].

	intValue := context uncheckedPeek asInteger.
	(intValue > 0 and: [intValue < 128 and: [classification at: intValue]]) ifFalse: [ 
		^ failure
	].
	^ super parseOn: context