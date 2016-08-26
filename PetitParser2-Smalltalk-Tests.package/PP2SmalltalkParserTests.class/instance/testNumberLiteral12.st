testing-literals
testNumberLiteral12
	super testNumberLiteral12.
	self assert: result isLiteralNode.
	self assert: result value equals: 175.
	self assert: result value isInteger