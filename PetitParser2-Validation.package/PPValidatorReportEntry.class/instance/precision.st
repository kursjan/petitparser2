stats
precision
	( actual size = 0) ifTrue: [ ^ 1 ].
	
	^ self truePositives size / (self truePositives size + self falsePositives size) asFloat
	