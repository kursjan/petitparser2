parsing
parseOn: context
	| retval |
	(context atLastTrimming) ifTrue: [ ^ failure ].
	retval := strategy parseOn: context.
	context setLastTrimming.
	^ retval