testing-literals
testArrayLiteral1
	super testArrayLiteral1.
	self assert: result isLiteralNode.
	self assert: result value equals: #()