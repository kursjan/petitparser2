expressions
indentExpressionSourcesVerification
	^ self cachedValue: #indentExpressionSourcesVerification ifAbsent: [ 
		self inputs: #indentExpressionOfSize: steps: 50 amount: 1 max: 50.
	].
	
