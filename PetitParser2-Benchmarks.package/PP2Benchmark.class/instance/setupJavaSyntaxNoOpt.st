benchmarks - java
setupJavaSyntaxNoOpt
	self setup: PPJavaSyntax sources: 'java'.
	self parser name: 'Java Syntax (NoOpt)'.

	contextClass := PP2Context.
	selector := #'parseAdaptable:withContext:'.
	preferredRepetitions := 3.
