tests
testLiteral
	parser := $a asParser2.
	children := visitor visit: parser.
	
	self assert: children isCollection.
	self assert: children size = 1.
	self assert: children anyOne = parser.