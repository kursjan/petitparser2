testing
testAssignment1
	super testAssignment1.
	self assert: result isLiteralNode.
	self assert: result value equals: 1