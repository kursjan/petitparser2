tests
testVisitCharacter
	parser := $a asPParser.
	result := visitor visit: parser.
	
	self assert: result equals: visitor