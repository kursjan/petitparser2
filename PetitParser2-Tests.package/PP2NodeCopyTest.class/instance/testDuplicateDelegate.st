tests
testDuplicateDelegate
	| node nodeCopy |
	node := $a asPParser wrapped.
	
	nodeCopy := node duplicate.
	
	self assert: node equals: nodeCopy.
	self assert: node ~~ nodeCopy.
	
	self assert: node child equals: nodeCopy child.
	self assert: node child ~~ nodeCopy child.	