expressions
indentExpressionSourcesProfiling
	^ self cachedValue: #indentExpressionSourcesProfiling ifAbsentPut: [ 
		self inputs: #indentExpressionOfSize: steps: 50 amount: 1 max: 50.
	].
	
