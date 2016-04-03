as yet unclassified
testLiteral
	parser := $a asParser2.
	children := parser allChildren.
	
	self assert: children isCollection.
	self assert: children size = 1.
	self assert: children anyOne = parser.