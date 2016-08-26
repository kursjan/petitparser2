testing-literals
testNumberLiteral3
	super testNumberLiteral3.
	self assert: result isLiteralNode.
	self assert: result value equals: 123.
	self assert: result value isInteger