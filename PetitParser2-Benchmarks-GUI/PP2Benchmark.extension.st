Extension { #name : #PP2Benchmark }

{ #category : #'*PetitParser2-Benchmarks-GUI' }
PP2Benchmark >> showTimeToRun [
	| g |
	g := PP2TimeToRunGraph new.
	g report: report.
	^ g draw
]

{ #category : #'*PetitParser2-Benchmarks-GUI' }
PP2Benchmark >> showTpcs [
	| g |
	g := PP2TpcsGraph new.
	g report: report.
	^ g draw
]
