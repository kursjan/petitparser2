testing-literals
testNumberLiteral6
	super testNumberLiteral6.
	self assert: result isLiteralNode.
	self assert: result value equals: -0.1.
	self assert: result value isFloat