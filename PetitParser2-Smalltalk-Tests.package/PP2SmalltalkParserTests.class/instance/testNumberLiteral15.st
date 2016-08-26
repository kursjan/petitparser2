testing-literals
testNumberLiteral15
	super testNumberLiteral15.
	self assert: result isLiteralNode.
	self assert: result value equals: 1 / 2