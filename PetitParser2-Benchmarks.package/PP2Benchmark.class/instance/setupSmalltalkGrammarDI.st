benchmarks - smalltalk
setupSmalltalkGrammarDI
	self setup: PP2SmalltalkGrammar sources: 'smalltalk'.
	self parser name: 'Smalltalk Grammar (DI)'.
	
	contextClass := PP2ImmutableSuccess.
	selector := #'parseDirectly:withContext:'.
	preferredRepetitions := 3.
	