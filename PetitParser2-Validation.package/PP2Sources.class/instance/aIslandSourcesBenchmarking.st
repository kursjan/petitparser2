seas
aIslandSourcesBenchmarking
	^ self cachedValue: #aIslandSourcesBenchmarking ifAbsentPut: [ 
		self inputs: #aIslandOfSize: steps: 30 amount: 1 max: 1*1000*1000
	]