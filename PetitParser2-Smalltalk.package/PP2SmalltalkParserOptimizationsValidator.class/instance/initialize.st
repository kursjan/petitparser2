initialization
initialize
	super initialize.
	
	parser := PP2SmalltalkParser new.
	optimizedParser := PP2SmalltalkParser new optimize