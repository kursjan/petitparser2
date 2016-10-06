as yet unclassified
testLiteralObject
	parser := $a asParser2.
	
	self visit: parser.
	
	self assert: result isEmpty.