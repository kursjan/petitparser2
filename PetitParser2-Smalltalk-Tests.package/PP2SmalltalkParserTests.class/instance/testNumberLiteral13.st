testing-literals
testNumberLiteral13
	super testNumberLiteral13.
	self assert: result isLiteralNode.
	self assert: result value equals: 202.9921875.
	self assert: result value isFloat