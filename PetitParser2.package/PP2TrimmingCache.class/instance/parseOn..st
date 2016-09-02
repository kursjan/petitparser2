parsing
parseOn: context
	| retval |
	(context position == lastTrimming) ifTrue: [ ^ failure ].
	retval := strategy parseOn: context.
	lastTrimming := context position.
	^ retval