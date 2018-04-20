initialization
initialize
	super initialize.
	
	keyStream := PP2AsyncStream new.
	outputStream := Transcript.