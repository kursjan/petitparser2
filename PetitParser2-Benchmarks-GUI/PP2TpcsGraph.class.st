Class {
	#name : #PP2TpcsGraph,
	#superclass : #PP2FiveNumberSummaryGraph,
	#category : 'PetitParser2-Benchmarks-GUI-Graphs'
}

{ #category : #accessing }
PP2TpcsGraph >> extractBlock [
	^ [ :ds | report tpcsFrom: ds ]
]

{ #category : #accessing }
PP2TpcsGraph >> title [
	^ 'Time Per Character'
]
