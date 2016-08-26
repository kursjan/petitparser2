testing-literals
testNumberLiteral11
	super testNumberLiteral11.
	self assert: result isLiteralNode.
	self assert: result value equals: 511.
	self assert: result value isInteger