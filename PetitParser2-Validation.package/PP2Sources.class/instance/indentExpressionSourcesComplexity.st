expressions
indentExpressionSourcesComplexity
	^ self cachedValue: #indentExpressionSourcesComplexity ifAbsent: [ 
		self inputs: #indentExpressionOfSize: steps: 50 amount: 3 max: 2000.
	].
	
