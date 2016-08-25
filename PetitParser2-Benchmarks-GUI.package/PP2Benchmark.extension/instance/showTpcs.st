*PetitParser2-Benchmarks-GUI
showTpcs
	| g |
	g := PP2TpcsGraph new.
	g report: report.
	^ g draw