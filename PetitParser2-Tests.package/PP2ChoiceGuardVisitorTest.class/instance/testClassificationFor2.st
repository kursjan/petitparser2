tests
testClassificationFor2
	| classification |
	parser := #letter asParser2 / #digit asParser2.
	
	classification := visitor classificationFor: parser.
	
	1 to: 255 do: [ :index | 
		self assert: (classification at: index) equals: ((Character codePoint: index )isAlphaNumeric).
	]