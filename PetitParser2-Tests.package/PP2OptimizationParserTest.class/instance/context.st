accessing
context
	context isNil ifTrue: [
		context := PP2RecordingContext new
	].

	^ context