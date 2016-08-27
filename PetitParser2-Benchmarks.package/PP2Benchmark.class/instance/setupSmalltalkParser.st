benchmarks - smalltalk
setupSmalltalkParser
	self setup: PP2SmalltalkParser sources: 'smalltalk'.
	self parser name: 'Smalltalk Parser'.
	
	contextClass := PP2Context.
	preferredRepetitions := 3