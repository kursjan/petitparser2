initialization
initialize
	super initialize.
	resources := self createResources.
	
	contextClass := PP2Context.
	preferredRepetitions := 1.
	report := PP2BenchmarkReport new.
	sourcesSize := 'Benchmarking'.
	
	selector := #'parse:withContext:'