benchmarks - smalltalk
setupSmalltalkGrammarDirect
	self setup: PP2SmalltalkGrammar sources: 'smalltalk'.
	self parser name: 'Smalltalk Grammar (Direct)'.
	
	contextClass := PP2ImmutableSuccess.
	selector := #'parseDirectly:withContext:'.
	preferredRepetitions := 3