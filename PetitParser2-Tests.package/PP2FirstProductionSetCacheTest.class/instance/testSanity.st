tests
testSanity
	| parser |
	parser := PP2ExpressionGrammar new.
	PP2FirstProductionSetCache new doPass: parser.
	
	parser allNodesDo: [ :child | 
		self assert: (child hasProperty: #firstProductionSet).
		self assert: (child firstProductionSet allSatisfy: [ :e | e isProduction  ])
	]