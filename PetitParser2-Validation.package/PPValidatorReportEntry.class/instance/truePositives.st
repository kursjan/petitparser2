stats
truePositives
	^ actual select: [ :e | (expected includes: e) ].
