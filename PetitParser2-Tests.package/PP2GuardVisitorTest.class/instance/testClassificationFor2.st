tests
testClassificationFor2
	| classification |
	parser := #letter asPParser / #digit asPParser.
	
	classification := visitor classificationFor: parser.
	
	1 to: 255 do: [ :index | 
		self assert: (classification at: index) equals: ((Character codePoint: index )isAlphaNumeric).
	]