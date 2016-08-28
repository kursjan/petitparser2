benchmarks - smalltalk
setupSmalltalkGrammarII
	self setup: PP2SmalltalkGrammar sources: 'smalltalk'.
	self parser name: 'Smalltalk Grammar (II)'.
	
	contextClass := PP2ImmutableSuccess.
	selector := #'parseInterpreted:withImmutableContext:'.
	preferredRepetitions := 3.