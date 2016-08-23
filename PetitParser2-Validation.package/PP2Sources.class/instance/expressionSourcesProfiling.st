expressions
expressionSourcesProfiling
	^ self cachedValue: #expressionSourcesProfiling ifAbsent: [ 
		self inputs: #expressionOfSize: steps: 50 amount: 1 max: 100.
	].
	
