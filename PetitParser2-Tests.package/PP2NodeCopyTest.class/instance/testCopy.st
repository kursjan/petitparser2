tests
testCopy
	| node nodeCopy |
	node := $a asPParser.
	
	nodeCopy := node copy.
	
	self assert: node equals: nodeCopy.
	self assert: node ~~ nodeCopy.
	
	self assert: node strategy node == node.
	self assert: nodeCopy strategy node == nodeCopy.