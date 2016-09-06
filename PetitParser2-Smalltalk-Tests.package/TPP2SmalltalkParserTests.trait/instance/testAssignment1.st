testing
testAssignment1
	super testAssignment1.
	self assert: self result isLiteralNode.
	self assert: self result value equals: 1