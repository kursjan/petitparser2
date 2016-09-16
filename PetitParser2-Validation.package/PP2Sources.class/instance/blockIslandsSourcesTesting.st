seas
blockIslandsSourcesTesting
	^ self cachedValue: #blockIslandsSourcesTesting ifAbsentPut: [ 
		self inputs: #blockIslandsOfSize: steps: 30 amount: 1 max: 1*1000
	]