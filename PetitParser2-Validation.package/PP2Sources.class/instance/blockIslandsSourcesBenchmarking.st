seas
blockIslandsSourcesBenchmarking
	^ self cachedValue: #blockIslandsSourcesBenchmarking ifAbsentPut: [ 
		self inputs: #blockIslandsOfSize: steps: 30 amount: 1 max: 1*1000*1000
	]