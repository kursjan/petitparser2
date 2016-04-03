as yet unclassified
testSequence
	parser := $a asParser2, $b asParser2.
	children := parser allChildren.
	
	self assert: children isCollection.
	self assert: children size = 3.
	self assert: (children includes: parser).
	self assert: (children includes: parser firstChild).
	self assert: (children includes: parser secondChild).