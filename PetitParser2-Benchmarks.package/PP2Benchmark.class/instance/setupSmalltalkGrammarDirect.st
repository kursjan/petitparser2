benchmarks - smalltalk
setupSmalltalkGrammarDirect
	self setup: PP2SmalltalkGrammar sources: 'smalltalk'.
	self parser name: 'Smalltalk Grammar (Direct)'.
	
	selector := #'parseDirectly:withContext:'