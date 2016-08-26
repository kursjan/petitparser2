benchmarks - smalltalk
setupSmalltalkGrammar
	self setup: PP2SmalltalkGrammar sources: 'smalltalk'.
	self parser name: 'Smalltalk Grammar (Interpreted)'.
	
	contextClass := PP2Context