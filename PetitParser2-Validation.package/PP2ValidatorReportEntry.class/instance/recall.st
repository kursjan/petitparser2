stats
recall
	(expected isEmpty) ifTrue: [ ^ 1 ].
	^ self truePositives size / (self truePositives size + self falseNegatives size) asFloat