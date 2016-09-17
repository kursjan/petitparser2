*PetitParser2-Smalltalk
setupSmalltalkParser
	self setup: PP2SmalltalkParser sources: 'smalltalk'.
	self parser name: 'Smalltalk Parser'.
	self parser optimize.
	
	contextClass := PP2InMemoryContext.
	selector := #'parseAdaptable:withContext:'.
	preferredRepetitions := 3.
	