initialization
initialize
	super initialize.
	resources := self createResources.
	
	contextClass := PP2Success.
	preferredRepetitions := 1.
	report := PP2BenchmarkReport new.
	sourcesSize := 'Benchmarking'