expressions
ll1expressionSourcesComplexity
	^ self cachedValue: #ll1expressionSourcesComplexity ifAbsentPut: [ 
		self inputs: #expressionOfSize: steps: 200 amount: 1 max: 10*1000.
	].
	
