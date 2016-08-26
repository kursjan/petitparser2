testing-literals
testNumberLiteral7
	super testNumberLiteral7.
	self assert: result isLiteralNode.
	self assert: result value equals: -123.
	self assert: result value isInteger