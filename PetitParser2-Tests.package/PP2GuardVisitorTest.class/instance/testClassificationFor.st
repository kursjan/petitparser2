tests
testClassificationFor
	| classification |
	parser := $a asPParser / $b asPParser.
	
	classification := visitor classificationFor: parser.
	
	self assert: classification at: $a codePoint.
	self assert: classification at: $b codePoint.
	self deny: classification at: $" codePoint.
	self deny: classification at: $c codePoint.	