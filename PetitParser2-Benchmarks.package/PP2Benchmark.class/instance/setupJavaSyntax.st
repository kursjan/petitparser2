benchmarks - java
setupJavaSyntax
	self setup: PPJavaSyntax sources: 'java'.
	self parser name: 'Java Syntax'.
	self parser optimize.
	
	contextClass := PP2InMemoryContext.
	selector := #'parseAdaptable:withContext:'.
	preferredRepetitions := 3.
	