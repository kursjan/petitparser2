benchmarks - smalltalk
setupSmalltalkGrammarIM
	self setup: PP2SmalltalkGrammar sources: 'smalltalk'.
	self parser name: 'Smalltalk Grammar (IM)'.
	
	contextClass := PP2Context.
	selector := #'parseInterpreted:withContext:'.
	preferredRepetitions := 3.