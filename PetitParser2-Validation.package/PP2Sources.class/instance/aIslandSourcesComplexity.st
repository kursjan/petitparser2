seas
aIslandSourcesComplexity
	^ self cachedValue: #aIslandSourcesComplexity ifAbsent: [ 
		self inputs: #aIslandOfSize: steps: 30 amount: 1 max: 1*1000*1000
	]