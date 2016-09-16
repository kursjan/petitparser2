micro
idsSourcesBenchmarking
	"
		PPValidatorSources current idsSourcesBenchmarking.
	"
	^ self cachedValue: #idsSourcesBenchmarking ifAbsentPut: [ 
		self inputs: #loremIpsum: steps: 50 amount: 1 max: 200*1000
	]