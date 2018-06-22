tests
testClassificationFor3
	| classification |
	parser := #letter asPParser / #eoi asPParser.
	
	classification := visitor classificationFor: parser.
	
	self assert: classification equals: (Array new: 255 withAll: true).