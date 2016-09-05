benchmarks - smalltalk
setupSmalltalkParserNoOpt
	self setup: PP2SmalltalkParser sources: 'smalltalk'.
	self parser name: 'Smalltalk Parser (Adapatable NoOpt)'.
	
	contextClass := PP2Context.
	selector := #'parseAdaptable:withContext:'.
	preferredRepetitions := 3.
	