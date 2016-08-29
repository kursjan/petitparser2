tests
testNoParent
	parser := $a asParser2.
	
	visitor visit: parser.
	
	self assert: parser parents isEmpty.