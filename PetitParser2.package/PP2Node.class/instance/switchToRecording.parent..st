recording
switchToRecording: toBeSwitched parent: nodeOrStrategy
	| recordingStrategy |
	recordingStrategy := toBeSwitched recording.
	recordingStrategy == toBeSwitched ifTrue: [ ^ toBeSwitched ].
	nodeOrStrategy strategy: recordingStrategy.

	^ recordingStrategy 