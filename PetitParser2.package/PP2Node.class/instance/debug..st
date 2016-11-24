accessing
debug: input
	^ self 
		enableDebug enableRecording 
		parse: input withContext: PP2RecordingContext new