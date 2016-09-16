seas
aIslandsSourcesProfiling
	^ self cachedValue: #aIslandsSourcesProfiling ifAbsentPut: [ 
		self inputs: #aIslandsOfSize: steps: 30 amount: 1 max: 2*1000
	]