tests
testFirstProductionSet

	parser := PP2SmalltalkGrammar new optimize.
	parser allNodesDo: [ :child |
		self assert: (child firstProductionSet allSatisfy: [ :e | e isProduction  ])
	]