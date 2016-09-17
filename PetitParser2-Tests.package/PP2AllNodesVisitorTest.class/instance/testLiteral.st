tests
testLiteral
	parser := $a asPParser.
	children := self visit: parser.
	
	self assert: children isCollection.
	self assert: children size = 1.
	self assert: children anyOne = parser.