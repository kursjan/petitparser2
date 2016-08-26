testing-literals
testNumberLiteral2
	super testNumberLiteral2.
	self assert: result isLiteralNode.
	self assert: result value equals: 0.1.
	self assert: result value isFloat