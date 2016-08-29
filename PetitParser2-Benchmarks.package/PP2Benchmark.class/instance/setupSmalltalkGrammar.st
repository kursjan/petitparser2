benchmarks - smalltalk
setupSmalltalkGrammar
	self setup: PP2SmalltalkGrammar sources: 'smalltalk'.
	self parser name: 'Smalltalk Grammar (Adapatable)'.
	self parser optimize.
	
	contextClass := PP2InMemoryContext.
	selector := #'parseAdaptable:withContext:'.
	preferredRepetitions := 3.
	