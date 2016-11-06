accessing
context
	context isNil ifTrue: [
		context := PP2ProfilingContext new
	].

	^ context