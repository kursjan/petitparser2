statistics
variance: data
	| mean squaredDiffs |
	mean := self mean: data.
	squaredDiffs := data collect: [ :value | (value - mean) abs squared ].
	
	^ squaredDiffs average