expressions
expressionSourcesComplexity
	^ self cachedValue: #expressionSourcesComplexity ifAbsent: [ 
		self inputs: #expressionOfSize: steps: 50 amount: 3 max: 2000.
	].
	
