tests
testParent
	parser := $a asParser2.
	parent := parser wrapped.
	
	visitor visit: parent.
	
	self assert: parser parents size equals: 1.
	self assert: parent parents isEmpty.
	self assert: parser parents includes: parent.