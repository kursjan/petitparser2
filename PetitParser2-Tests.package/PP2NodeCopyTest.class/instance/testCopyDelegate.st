tests
testCopyDelegate
	| node nodeCopy |
	node := $a asPParser wrapped.
	
	nodeCopy := node copy.
	
	self assert: node equals: nodeCopy.
	self assert: node ~~ nodeCopy.
	
	self assert: node child == nodeCopy child.