expressions
indentExpressionSourcesComplexity
	^ self cachedValue: #indentExpressionSourcesComplexity ifAbsentPut: [ 
		self inputs: #indentExpressionOfSize: steps: 50 amount: 3 max: 2000.
	].
	
