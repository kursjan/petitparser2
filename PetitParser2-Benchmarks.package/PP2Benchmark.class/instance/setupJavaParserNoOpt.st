benchmarks - java
setupJavaParserNoOpt
	self setup: PPJavaParser sources: 'java'.
	self parser name: 'Java Parser (NoOpt)'.

	contextClass := PP2Context.
	selector := #'parseAdaptable:withContext:'.
	preferredRepetitions := 3.
