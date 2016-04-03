as yet unclassified
testChoice
	parser := $a asParser2 / $b asParser2.
	children := parser allChildren.
	
	self assert: children isCollection.
	self assert: children size = 5.
	self assert: (children includes: parser).
	self assert: (children includes: parser firstChild child).
	self assert: (children includes: parser secondChild child).