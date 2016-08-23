seas
aIslandsSourcesBenchmarking
	^ self cachedValue: #aIslandsSourcesBenchmarking ifAbsent: [ 
		self inputs: #aIslandsOfSize: steps: 30 amount: 1 max: 1*1000*1000
	]