micro
idsSourcesBenchmarking
	"
		PPValidatorSources current idsSourcesBenchmarking.
	"
	^ self cachedValue: #idsSourcesBenchmarking ifAbsent: [ 
		self inputs: #loremIpsum: steps: 50 amount: 1 max: 200*1000
	]