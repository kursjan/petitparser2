expressions
ll1expressionSourcesBenchmarking
	^ self cachedValue: #ll1expressionSourcesBenchmarking ifAbsent: [ 
		self inputs: #expressionOfSize: steps: 50 amount: 3 max: 2000.
	].
	
