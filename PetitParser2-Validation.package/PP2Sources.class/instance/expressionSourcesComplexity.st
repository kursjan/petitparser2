expressions
expressionSourcesComplexity
	^ self cachedValue: #expressionSourcesComplexity ifAbsentPut: [ 
		self inputs: #expressionOfSize: steps: 50 amount: 3 max: 2000.
	].
	
