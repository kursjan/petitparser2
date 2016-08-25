*PetitParser2-Benchmarks-GUI
showTimeToRun
	| g |
	g := PP2TimeToRunGraph new.
	g report: report.
	^ g draw