testing-literals
testNumberLiteral4
	super testNumberLiteral4.
	self assert: result isLiteralNode.
	self assert: result value equals: 123.456.
	self assert: result value isFloat