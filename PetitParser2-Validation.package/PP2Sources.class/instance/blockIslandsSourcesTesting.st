seas
blockIslandsSourcesTesting
	^ self cachedValue: #blockIslandsSourcesTesting ifAbsent: [ 
		self inputs: #blockIslandsOfSize: steps: 30 amount: 1 max: 1*1000
	]