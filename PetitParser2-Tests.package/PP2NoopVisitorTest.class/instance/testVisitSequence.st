as yet unclassified
testVisitSequence
	parser := $a asPParser, $b asPParser.
	result := visitor visit: parser.
	
	self assert: result equals: visitor