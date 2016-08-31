stats
precision
	( actual isEmpty) ifTrue: [ ^ 1 ].
	
	^ self truePositives size / (self truePositives size + self falsePositives size) asFloat
	