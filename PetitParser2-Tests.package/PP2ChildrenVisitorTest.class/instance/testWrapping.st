as yet unclassified
testWrapping
	parser := $a asParser2 wrapped.
	children := parser allChildren.
	
	self assert: children isCollection.
	self assert: children size = 2.
	self assert: (children includes: parser child).
	self assert: (children includes: parser).	