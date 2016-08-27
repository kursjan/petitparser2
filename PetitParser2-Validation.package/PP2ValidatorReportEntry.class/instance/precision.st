stats
precision
	( actual size isEmpty) ifTrue: [ ^ 1 ].
	
	^ self truePositives size / (self truePositives size + self falsePositives size) asFloat
	