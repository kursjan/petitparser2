seas
aIslandSourcesProfiling
	^ self cachedValue: #aIslandSourcesProfiling ifAbsentPut: [ 
		self inputs: #aIslandOfSize: steps: 30 amount: 1 max: 100*1000
	]