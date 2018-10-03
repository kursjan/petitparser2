Class {
	#name : #PP2TimeToRunGraph,
	#superclass : #PP2FiveNumberSummaryGraph,
	#category : 'PetitParser2-Benchmarks-GUI-Graphs'
}

{ #category : #accessing }
PP2TimeToRunGraph >> extractBlock [
	^ [ :ds | report timesFrom: ds ]
]

{ #category : #accessing }
PP2TimeToRunGraph >> title [
	^ 'Time to Run'
]
