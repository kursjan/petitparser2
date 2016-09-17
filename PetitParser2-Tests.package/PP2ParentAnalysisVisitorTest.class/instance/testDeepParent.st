tests
testDeepParent
	| superParent |
	parser := $a asPParser.
	parent := parser wrapped.
	superParent := parent wrapped.
	
	visitor visit: superParent.
	
	self assert: parser parents anyOne equals: parent.
	self assert: parent parents anyOne equals: superParent.
	self assert: superParent parents isEmpty.