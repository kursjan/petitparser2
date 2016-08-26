testing-literals
testNumberLiteral1
	super testNumberLiteral1.
	self assert: result isLiteralNode.
	self assert: result value equals: 0.
	self assert: result value isInteger