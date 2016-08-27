benchmarks - smalltalk
setupSmalltalkGrammarIC
	self setup: PP2SmalltalkGrammar sources: 'smalltalk'.
	self parser name: 'Smalltalk Grammar (Interpreted IC)'.
	
	contextClass := PP2ImmutableSuccess.
	selector := #'parseInterpreted:withImmutableContext:'.
	preferredRepetitions := 3.