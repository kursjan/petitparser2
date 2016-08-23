stats
recall
	(expected size = 0) ifTrue: [ ^ 1 ].
	^ self truePositives size / (self truePositives size + self falseNegatives size) asFloat