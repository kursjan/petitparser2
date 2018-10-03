Extension { #name : #PP2ComplexityBenchmark }

{ #category : #'*PetitParser2-Benchmarks-GUI' }
PP2ComplexityBenchmark >> showComplexity [
	| g |
	g := PP2ComplexityGraph new.
	g report: report.
	^ g draw
]
