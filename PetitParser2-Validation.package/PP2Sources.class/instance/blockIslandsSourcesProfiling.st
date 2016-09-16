seas
blockIslandsSourcesProfiling
	^ self cachedValue: #blockIslandsSourcesProfiling ifAbsentPut: [ 
		self inputs: #blockIslandsOfSize: steps: 30 amount: 3 max: 2*1000
	]