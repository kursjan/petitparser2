benchmarks - smalltalk
setupSmalltalkGrammarNoOpt
	self setup: PP2SmalltalkGrammar sources: 'smalltalk'.
	self parser name: 'Smalltalk Grammar (Adapatable NoOpt)'.
	
	contextClass := PP2Context.
	selector := #'parseAdaptable:withContext:'.
	preferredRepetitions := 3.
	