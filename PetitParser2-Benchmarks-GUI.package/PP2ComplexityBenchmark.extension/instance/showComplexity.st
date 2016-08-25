*PetitParser2-Benchmarks-GUI
showComplexity
	| g |
	g := PP2ComplexityGraph new.
	g report: report.
	^ g draw