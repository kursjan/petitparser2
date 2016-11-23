recording
switchToRecording: strategy parent: nodeOrStrategy
	| recordingStrategy |
	recordingStrategy := strategy recording.
	recordingStrategy == strategy ifTrue: [ ^ strategy ].
	nodeOrStrategy strategy: recordingStrategy.

	^ recordingStrategy 