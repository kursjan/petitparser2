benchmarks - java
setupJavaParser
	self setup: PPJavaParser sources: 'java'.
	self parser name: 'Java Parser'.
	self parser optimize.
	
	contextClass := PP2InMemoryContext.
	selector := #'parseAdaptable:withContext:'.
	preferredRepetitions := 3.
	