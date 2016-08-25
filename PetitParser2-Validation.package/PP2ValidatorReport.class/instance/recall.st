stats
recall
	| truePositives falseNegatives |
	truePositives := entries values inject: 0 into: [ :sum :e | sum + e truePositives size ].
	falseNegatives := entries values inject: 0 into: [ :sum :e | sum + e falseNegatives size ].

	^ truePositives / (truePositives + falseNegatives) asFloat
	