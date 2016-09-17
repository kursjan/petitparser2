tests
testNoParent
	parser := $a asPParser.
	
	visitor visit: parser.
	
	self assert: parser parents isEmpty.