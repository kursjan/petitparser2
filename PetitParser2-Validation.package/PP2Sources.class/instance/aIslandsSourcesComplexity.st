seas
aIslandsSourcesComplexity
	^ self cachedValue: #aIslandsSourcesComplexity ifAbsentPut: [ 
		self inputs: #aIslandsOfSize: steps: 30 amount: 1 max: 100*1000
	]