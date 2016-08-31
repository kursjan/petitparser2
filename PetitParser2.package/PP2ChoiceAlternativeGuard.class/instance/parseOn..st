parsing
parseOn: context
	| intValue |
	context atEnd ifTrue: [ ^ super parseOn: context ].

	intValue := context uncheckedPeek asInteger.
	intValue == 0 ifTrue: [ ^ super parseOn: context ].
	intValue > 255 ifTrue: [ ^ super parseOn: context ].
	(classification at: intValue) ifTrue: [ ^ super parseOn: context ].

	^ failure