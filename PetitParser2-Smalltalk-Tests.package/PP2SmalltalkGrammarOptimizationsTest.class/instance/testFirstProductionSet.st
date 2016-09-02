tests
testFirstProductionSet
	| trimmings |
	parser := PP2SmalltalkGrammar new optimize.
	parser allChildrenDo: [ :child |
		self assert: (child firstProductionSet allSatisfy: [ :e | e isProduction  ])
	]