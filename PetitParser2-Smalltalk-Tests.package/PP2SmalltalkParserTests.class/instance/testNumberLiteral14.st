testing-literals
testNumberLiteral14
	super testNumberLiteral14.
	self assert: result isLiteralNode.
	self assert: result value floor equals: -9.
	self assert: result value isFloat