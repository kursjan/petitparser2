stats
precision
	| truePositives falsePositives |
	truePositives := entries  inject: 0 into: [ :sum :e | sum + e truePositives size ].
	falsePositives := entries values inject: 0 into: [ :sum :e | sum + e falsePositives size ].
	
	^ truePositives / (truePositives + falsePositives) asFloat
	