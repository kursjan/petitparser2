testing-literals
testArrayLiteral5
	super testArrayLiteral5.
	self assert: result isLiteralNode.
	self assert: result value equals: #($a)