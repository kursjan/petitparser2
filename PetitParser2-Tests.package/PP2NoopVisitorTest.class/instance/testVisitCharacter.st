tests
testVisitCharacter
	parser := $a asParser2.
	result := visitor visit: parser.
	
	self assert: result equals: #()