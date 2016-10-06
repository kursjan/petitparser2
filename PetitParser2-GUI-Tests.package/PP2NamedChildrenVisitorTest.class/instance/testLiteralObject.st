as yet unclassified
testLiteralObject
	parser := $a asPParser.
	
	self visit: parser.
	
	self assert: result isEmpty.