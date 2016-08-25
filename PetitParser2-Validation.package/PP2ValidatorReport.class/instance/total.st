stats
total
	^ entries values inject: 0 into: [ :sum :e | sum + e expected size ].	