seas
blockIslandsSourcesComplexity
	^ self cachedValue: #blockIslandsSourcesComplexity ifAbsent: [ 
		self inputs: #blockIslandsOfSize: steps: 30 amount: 1 max: 50*1000
	]