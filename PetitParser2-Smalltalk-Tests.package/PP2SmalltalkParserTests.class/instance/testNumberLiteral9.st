testing-literals
testNumberLiteral9
	super testNumberLiteral9.
	self assert: result isLiteralNode.
	self assert: result value equals: -123.456.
	self assert: result value isFloat